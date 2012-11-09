class TwitterList < ActiveRecord::Base
	attr_accessible :id, :list_slug, :name, :owner_screen_name
	has_many :tweets, :through => :twitter_list_tweets


	def perform 
		Rails.logger.info "Owner : #{owner_screen_name} ..."
		Rails.logger.info "Name : #{name} ..."
		Rails.logger.info "Getting tweets for list #{list_slug} ..."
	
		members = nil
		max_attempts = 1
		num_attempts = 0	
		begin
			num_attempts += 1
			members = Twitter.list_members(owner_screen_name, list_slug)
		rescue Twitter::Error::TooManyRequests => error
			if num_attempts <= max_attempts
    		# NOTE: Your process could go to sleep for up to 15 minutes but if you
    		# retry any sooner, it will almost certainly fail with the same exception.
    		sleep error.rate_limit.reset_in
    		retry
  		else
				raise
			end
		end
		members.each do |user| 
			tweets = nil
			max_attempts = 1
			num_attempts = 0	
			begin
				num_attempts += 1
				tweets = Twitter.user_timeline(user.id, :count => 5) 
			rescue Twitter::Error::TooManyRequests => error
				if num_attempts <= max_attempts
    			# NOTE: Your process could go to sleep for up to 15 minutes but if you
    			# retry any sooner, it will almost certainly fail with the same exception.
    			sleep error.rate_limit.reset_in
    			retry
  			else
					raise
				end
			end

			tweets.each do |t|
				if (!Tweet.where(:twitter_id => t.attrs[:id_str]).empty?) 
					# Rails.logger.info "Tweet exists" 
					next
				end

				# new tweet
				tweet = Tweet.new
				tweet.twitter_id = t.attrs[:id]
				tweet.twitter_create_at = t.attrs[:created_at]
				tweet.text = t.attrs[:text]
				tweet.source = t.attrs[:source]

				entities = t.attrs[:entities]
				user = t.attrs[:user]
				tweet.username = user[:screen_name]
				tweet.usericon = user[:profile_image_url]

				tweet.media_url = nil
				if (!entities[:media].nil? && entities[:media][0][:type] == 'photo') 
					tweet.media_url =  entities[:media][0][:media_url]
				end

				if (!entities[:urls].nil? && !(entities[:urls].length < 1))  
					entities[:urls].each do |url|
						path = url[:expanded_url]
						if path =~ /twitpic|yfrog/
							tweet.media_url = StraightDope.extract_media(path)[0]
						elsif path =~ /lockerz/
							tweet.media_url = "http://api.plixi.com/api/tpapi.svc/imagefromurl?url=#{path}&size=medium"
						end
					end
				end

				if (tweet.media_url.nil?) 
					# puts("No media")
					next
				end
				
				tweet.save
			 	Rails.logger.info "Saving tweet #{tweet.twitter_id} ..."

				join = TwitterListTweet.new
				join.twitter_list_id = id
				join.tweet_id = tweet.id
				join.save
			end
		end	

	end
end

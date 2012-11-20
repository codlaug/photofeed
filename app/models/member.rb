class Member < ActiveRecord::Base
	attr_accessible :id, :user_id
	has_many :twitter_lists, :through => :twitter_list_members
	has_many :twitter_list_members


	def perform 
		Rails.logger.info "DEBUG : id : #{id} ..."
		Rails.logger.info "DEBUG : user_id : #{user_id} ..."
		tweets = nil
		max_attempts = 1
		num_attempts = 0	
		begin
			num_attempts += 1
			tweets = Twitter.user_timeline(user_id.to_i, :count => 5) 
			Rails.logger.info "DEBUG : Getting tweets for #{user_id}"
		rescue Twitter::Error::TooManyRequests => error
			if num_attempts <= max_attempts
				# NOTE: Your process could go to sleep for up to 15 minutes but if you
				# retry any sooner, it will almost certainly fail with the same exception.
				Rails.logger.info "DEBUG : User Timeline rate limit reset : #{error.rate_limit.reset_in}"
				sleep error.rate_limit.reset_in
				retry
			else
				raise
			end
		rescue Twitter::Error::NotFound => error
			# need handling here
			raise
		end

		Rails.logger.info "DEBUG : Processing tweets for #{user_id}"
		tweets.each do |t|

			# need better solution for dups
			if (!Tweet.where(:twitter_id => t.attrs[:id_str]).empty?) 
				Rails.logger.info "DEBUG : Tweet exists" 
				next
			end

			# new tweet
			tweet = Tweet.new
			tweet.twitter_id = t.id
			tweet.twitter_create_at = t.created_at
			tweet.twitter_created_at = Time.zone.parse(t.twitter_create_at).utc
			tweet.text = t.text
			tweet.source = t.source
			tweet.user_id = t.user.id
			tweet.username = t.user.screen_name
			tweet.usericon = t.user.profile_image_url


			entities = t.attrs[:entities]

			tweet.media_url = nil
			if (!t.media.empty? ) 
				tweet.media_url =  t.media[0].media_url
			end

			if (!(t.urls.length < 1))  
				t.urls.each do |url|
					path = url.expanded_url
					if path =~ /twitpic|yfrog/
						tweet.media_url = StraightDope.extract_media(path)[0]
					elsif path =~ /lockerz/
						tweet.media_url = "http://api.plixi.com/api/tpapi.svc/imagefromurl?url=#{path}&size=medium"
					end
				end
			end

			if (tweet.media_url.nil?) 
				next
			end

			tweet.save
			Rails.logger.info "DEBUG : Saving tweet #{tweet.twitter_id} ..."

			# get twitter lists for this member
			twitter_list_ids = TwitterListMember.where(:member_id => id).collect { |twm| twm.twitter_list_id }
			twitter_list_ids.each do |twitter_list_id|
				# add to twitter_list_tweets
				join = TwitterListTweet.new
				join.twitter_list_id = twitter_list_id
				join.tweet_id = tweet.id
				join.save
			end
			# end tweets
		end
		# make sure we do not exceed 180 calls in 15 minutes
		sleep 6
	end
end

class TwitterList < ActiveRecord::Base
	attr_accessible :id, :list_slug, :name, :owner_screen_name
	has_many :tweets, :through => :twitter_list_tweets


	def perform 
		puts "Owner : #{owner_screen_name} ..."
		puts "Name : #{name} ..."
		puts "Getting tweets for list #{list_slug} ..."

		members = Twitter.list_members(owner_screen_name, list_slug)

		members.each do |user| 
			#source = Twitter.status(user.status.id)
			tweets = Twitter.user_timeline(user.id, :count => 5) 

			tweets.each do |t|
				if (!Tweet.where(:twitter_id => t.attrs[:id_str]).empty?) 
					# puts("Tweet exists")
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
				puts "Saving tweet #{tweet.twitter_id} ..."

				join = TwitterListTweet.new
				join.twitter_list_id = id
				join.tweet_id = tweet.id
				join.save
			end
		end	

	end
end

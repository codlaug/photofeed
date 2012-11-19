namespace :tweet  do
  desc "Convert stringifid timestamps from twitter_create_at to real timestamps in twitter_created_at"
  task :timestamp_convert => :environment do
    Tweet.all.each do |tweet| 
      tweet.twitter_created_at = Time.zone.parse(tweet.twitter_create_at).utc
      tweet.save 
    end
  end
end
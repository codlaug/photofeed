class TwitterMemberTweet < ActiveRecord::Base
  attr_accessible :id, :tweet_id, :twitter_member_id
end

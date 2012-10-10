class TwitterListTweet < ActiveRecord::Base
  attr_accessible :tweet_id, :twitter_list_id
  belongs_to :tweet
  belongs_to :twitter_list
end

class TwitterList < ActiveRecord::Base
  attr_accessible :id, :list_slug, :name, :owner_screen_name
  has_many :tweets, :through => :twitter_list_tweets
end

class Tweet < ActiveRecord::Base
  attr_accessible :display_url, :expanded_url, :id, :user_id, :media_url, :media_url_https, :source, :text, :twitter_create_at, :twitter_id, :url
  has_many :twitter_lists, :through => :twitter_list_tweets
  has_many :twitter_list_tweets
	#paginates_per 50
	#max_paginates_per 100
end

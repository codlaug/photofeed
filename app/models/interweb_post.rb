class InterwebPost < ActiveRecord::Base
  attr_accessible :display_url, :expanded_url, :id, :user_id, :media_url, :media_url_https, :source, :text, :twitter_create_at, :twitter_created_at, :twitter_id, :url
	paginates_per 49
	#max_paginates_per 100

  default_scope order('twitter_created_at DESC')
end

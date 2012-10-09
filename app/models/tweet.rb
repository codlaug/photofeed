class Tweet < ActiveRecord::Base
  attr_accessible :display_url, :expanded_url, :id, :media_url, :media_url_https, :source, :text, :twitter_create_at, :twitter_id, :url
end

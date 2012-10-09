class TwitterMember < ActiveRecord::Base
  attr_accessible :description, :id, :location, :name, :screen_name, :twitter_id, :url
end

class TwitterList < ActiveRecord::Base
  attr_accessible :id, :list_slug, :name, :owner_screen_name
end

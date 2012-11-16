class TwitterListMember < ActiveRecord::Base
  attr_accessible :id, :member_id, :twitter_list_id
end

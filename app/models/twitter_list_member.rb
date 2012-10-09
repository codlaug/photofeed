class TwitterListMember < ActiveRecord::Base
  attr_accessible :id, :twitter_list_id, :twitter_member_id
end

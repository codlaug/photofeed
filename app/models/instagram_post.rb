class InstagramPost < InterwebPost
  attr_accessible :usericon, :username

  def self.create_from_instagram_response_hash obj
    attributes = {}
    attributes[:twitter_created_at] = Time.at(obj.created_time.to_i).to_datetime
    attributes[:media_url]          = obj.images.thumbnail.url
    attributes[:url]                = obj.link
    attributes[:twitter_id]         = obj.id
    attributes[:user_id]            = obj.user.id
    attributes[:usericon]           = obj.user.profile_picture
    attributes[:username]           = obj.user.username
    attributes[:text]               = obj.caption ? obj.caption.text : ""
    attributes[:url]                = obj.images.standard_resolution.url
    create attributes
  end
  
end

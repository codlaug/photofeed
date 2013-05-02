class InstagramPost < InterwebPost
  attr_accessible :usericon, :username

  belongs_to :instagram_account

  def self.initialize_from_instagram_response_hash obj
    begin
      attributes = {}
      attributes[:twitter_created_at] = Time.at(obj.created_time.to_i).to_datetime
      attributes[:media_url]          = obj.images.thumbnail.url
      attributes[:url]                = obj.link
      attributes[:twitter_id]         = obj.id
      attributes[:user_id]            = obj.user.id
      attributes[:usericon]           = obj.user.profile_picture
      attributes[:username]           = obj.user.username
      attributes[:text]               = obj.caption ? obj.caption.text : ""
      attributes[:url]                = "http://web.stagram.com/p/#{obj.id}"
      new attributes
    rescue
      raise "Something bad happened. The instagram response looks like this #{obj.inspect}"
    end
  end


  # Being lazy here - the interweb_posts table still
  # has some column names that are specific to twitter
  def instagram_post_id
    twitter_id
  end

  def instagram_post_id= value
    self.twitter_id = value
  end
  
end

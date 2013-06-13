class InstagramAccount < ActiveRecord::Base
  
  has_many :instagram_posts, :dependent => :destroy, :order => 'created_at DESC'
  belongs_to :pod, :inverse_of => :instagram_account

  attr_accessible :username, :pod_id
  validates :username, :presence => true

  has_many :instagram_users, :dependent => :destroy
  accepts_nested_attributes_for :instagram_users, :reject_if => proc { |attributes| attributes['username'].blank? }, :allow_destroy => true
  attr_accessible :instagram_users_attributes


  def poll
    if access_token.present? and time_to_poll?
      self.last_query_at = Time.now
      self.save!

      instagram_results = client.user_media_feed( :min_id => latest_post_id )
      instagram_users.select{|u| u.instagram_id }.each do |instagram_user|
        instagram_results += client.user_recent_media(instagram_user.instagram_id, :min_id => latest_post_id)
      end

      instagram_results.each do |gram|
        instagram_post = InstagramPost.initialize_from_instagram_response_hash gram
        instagram_posts << instagram_post
        instagram_post.save!
      end
    end
  end

  def client
    @client ||= Instagram.client :access_token => self.access_token
  end

private

  def latest_post_id
    post = self.instagram_posts.first
    post ? post.instagram_post_id : nil
  end

  def time_to_poll?
    last_query_at.blank? or Time.now - Time.at(last_query_at) > 15.minutes
  end

end
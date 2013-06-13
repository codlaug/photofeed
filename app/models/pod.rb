class Pod < ActiveRecord::Base

  validates :name, :uniqueness => true
  attr_accessible :name

  
  has_one :instagram_account, :dependent => :destroy, :inverse_of => :pod
  accepts_nested_attributes_for :instagram_account, :reject_if => proc { |attributes| attributes['username'].blank? }, :allow_destroy => true
  attr_accessible :instagram_account_attributes
  
  has_many :grams, :class_name => 'InstagramPost', :through => :instagram_account, :source => :instagram_posts, :order => 'twitter_created_at DESC'


  has_many :twitter_lists, :dependent => :destroy, :inverse_of => :pod, :order => 'id ASC'
  accepts_nested_attributes_for :twitter_lists, :reject_if => proc { |attributes| attributes['owner_screen_name'].blank? }, :allow_destroy => true
  attr_accessible :twitter_lists_attributes

  has_many :tweets, :through => :twitter_lists, :order => 'twitter_created_at DESC'


  

  
  def interweb_posts
    (grams.limit(80) + tweets.limit(80)).sort_by(&:twitter_created_at).reverse
  end


  def check_instagram
    instagram_account.poll if instagram_account
  end

  def build_web_accounts
    self.twitter_lists.build if self.twitter_lists.blank?
    self.instagram_account ||= self.build_instagram_account
  end

end
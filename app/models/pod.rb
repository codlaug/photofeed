class Pod < ActiveRecord::Base

  validates :name, :uniqueness => true
  attr_accessible :name


  has_one :instagram_account, :dependent => :destroy, :inverse_of => :pod
  accepts_nested_attributes_for :instagram_account
  attr_accessible :instagram_account_attributes
  
  has_many :grams, :class_name => 'InstagramPost', :through => :instagram_account, :source => :instagram_posts, :order => 'twitter_created_at DESC'



  has_one :twitter_list, :dependent => :destroy, :inverse_of => :pod
  accepts_nested_attributes_for :twitter_list
  attr_accessible :twitter_list_attributes

  has_many :tweets, :through => :twitter_list, :order => 'twitter_created_at DESC'


  

  
  def interweb_posts
    (grams.limit(40) + tweets.limit(40)).sort_by(&:twitter_created_at).reverse.take(40)
  end


  def check_instagram
    instagram_account.poll if instagram_account
  end

  def build_web_accounts
    self.twitter_list ||= self.build_twitter_list
    self.instagram_account ||= self.build_instagram_account
  end

end
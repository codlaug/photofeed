class InstagramUser < ActiveRecord::Base

  attr_accessible :username
  validates :username, :presence => true

  belongs_to :instagram_account

  after_save :get_user_id

  private

  def get_user_id
    update_column :instagram_id, instagram_account.client.user_search(self.username).first.id
  end

end

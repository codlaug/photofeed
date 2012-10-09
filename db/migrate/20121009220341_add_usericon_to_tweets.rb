class AddUsericonToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :usericon, :string
  end
end

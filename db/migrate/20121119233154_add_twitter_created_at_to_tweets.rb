class AddTwitterCreatedAtToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :twitter_created_at, :timestamp
  end
end

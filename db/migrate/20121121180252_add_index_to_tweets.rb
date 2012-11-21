class AddIndexToTweets < ActiveRecord::Migration
  def change
    add_index :tweets, :twitter_created_at, :order => { :twitter_created_at => :desc }	
  end
end

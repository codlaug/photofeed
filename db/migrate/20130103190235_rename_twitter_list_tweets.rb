class RenameTwitterListTweets < ActiveRecord::Migration
  def up
    rename_table :twitter_list_tweets, :tweets_twitter_lists
    add_index :tweets_twitter_lists, :twitter_list_id
    add_index :tweets_twitter_lists, :tweet_id
  end

  def down
    remove_index :tweets_twitter_lists, :twitter_list_id
    remove_index :tweets_twitter_lists, :tweet_id
    rename_table :tweets_twitter_lists, :twitter_list_tweets
  end
end

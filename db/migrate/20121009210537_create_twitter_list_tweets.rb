class CreateTwitterListTweets < ActiveRecord::Migration
  def change
    create_table :twitter_list_tweets do |t|
      t.integer :twitter_list_id
      t.integer :tweet_id

      t.timestamps
    end
  end
end

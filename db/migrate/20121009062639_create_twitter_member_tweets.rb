class CreateTwitterMemberTweets < ActiveRecord::Migration
  def change
    create_table :twitter_member_tweets do |t|
      t.integer :id
      t.integer :twitter_member_id
      t.integer :tweet_id

      t.timestamps
    end
  end
end

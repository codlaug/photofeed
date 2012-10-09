class RemoveTwitterMember < ActiveRecord::Migration
  def up
		drop_table :twitter_members
		drop_table :twitter_member_tweets
  end

  def down
		create_table :twitter_members do |t|
      t.string :twitter_id
      t.string :name
			t.string :screen_name
			t.string :location
			t.string :description
			t.string :url
      t.timestamps 
		end
			
		create_table :twitter_member_tweets do |t|
			t.integer :twitter_member_id
			t.integer :tweet_id
			t.timestamps
		end

	end
end

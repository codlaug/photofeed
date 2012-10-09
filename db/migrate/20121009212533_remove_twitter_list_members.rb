class RemoveTwitterListMembers < ActiveRecord::Migration
  def up
		drop_table :twitter_list_members
  end

  def down
		create_table :twitter_list_members do |t|
			t.integer :twitter_list_id
			t.integer :twitter_member_id
			t.timestamps
		end

  end
end

class RenameTwitterListMembers < ActiveRecord::Migration
  def up
    rename_table :twitter_list_members, :members_twitter_lists
    add_index :members_twitter_lists, :twitter_list_id
    add_index :members_twitter_lists, :member_id
  end

  def down
    remove_index :members_twitter_lists, :twitter_list_id
    remove_index :members_twitter_lists, :member_id
    rename_table :members_twitter_lists, :twitter_list_members
  end
end

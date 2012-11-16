class CreateTwitterListMembers < ActiveRecord::Migration
  def change
    create_table :twitter_list_members do |t|
      t.integer :id
      t.integer :twitter_list_id
      t.integer :member_id

      t.timestamps
    end
  end
end

class CreateTwitterMembers < ActiveRecord::Migration
  def change
    create_table :twitter_members do |t|
      t.integer :id
      t.string :twitter_id
      t.string :name
      t.string :screen_name
      t.string :location
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end

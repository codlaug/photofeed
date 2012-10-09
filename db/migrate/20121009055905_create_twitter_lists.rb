class CreateTwitterLists < ActiveRecord::Migration
  def change
    create_table :twitter_lists do |t|
      t.integer :id
      t.string :name
      t.string :owner_screen_name
      t.string :list_slug

      t.timestamps
    end
  end
end

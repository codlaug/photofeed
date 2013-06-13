class CreateInstagramUsers < ActiveRecord::Migration
  def change
    create_table :instagram_users do |t|
      t.string :instagram_id
      t.string :username
      t.references :instagram_account
      t.timestamps
    end
    add_index :instagram_users, :instagram_account_id
  end
end

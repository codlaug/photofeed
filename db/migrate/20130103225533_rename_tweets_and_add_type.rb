class RenameTweetsAndAddType < ActiveRecord::Migration
  def up
    rename_table :tweets, :interweb_posts
    add_column :interweb_posts, :type, :string

    InterwebPost.all.each do |post|
      post.type = "Tweet"
      post.save!
    end
  end

  def down
    remove_column :interweb_posts, :type
    rename_table :interweb_posts, :tweets
  end
end

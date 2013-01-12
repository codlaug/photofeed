class ChangeTextColumnToText < ActiveRecord::Migration
  def up
    change_column :interweb_posts, :text, :text
  end

  def down
    change_column :interweb_posts, :text, :string
  end
end

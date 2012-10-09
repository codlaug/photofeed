class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :id
      t.string :twitter_create_at
      t.string :twitter_id
      t.string :text
      t.string :source
      t.string :media_url
      t.string :media_url_https
      t.string :url
      t.string :display_url
      t.string :expanded_url

      t.timestamps
    end
  end
end

class CreatePodTwitterLists < ActiveRecord::Migration
  def change
    create_table :pod_twitter_lists do |t|
      t.integer :id
      t.integer :pod_id
      t.integer :twitter_list_id

      t.timestamps
    end
  end
end

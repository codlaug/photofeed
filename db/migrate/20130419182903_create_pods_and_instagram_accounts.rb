class CreatePodsAndInstagramAccounts < ActiveRecord::Migration
  def up

    create_table :pods do |t|
      t.string :name

      t.timestamps
    end
    add_index :pods, :name

    add_column :twitter_lists, :pod_id, :integer
    add_index :twitter_lists, :pod_id

    remove_column :twitter_lists, :name

    create_table :instagram_accounts do |t|
      t.string :username
      t.string :password
      t.datetime :last_query_at
      t.string :access_token
      t.references :pod
    end
    add_index :instagram_accounts, :pod_id

    add_column :interweb_posts, :instagram_account_id, :integer
    add_index :interweb_posts, :instagram_account_id
    add_index :interweb_posts, :type


    TwitterList.all.each do |twitter_list|
      pod = Pod.find_or_initialize_by_name twitter_list.owner_screen_name
      pod.instagram_account = nil
      pod.twitter_list = twitter_list
      pod.save!
      twitter_list.save!
    end


  end

end

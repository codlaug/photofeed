class AllowNullColumnsOnJoinTables < ActiveRecord::Migration
  def up
    change_column :tweets_twitter_lists, :created_at, :datetime, {:null => true}
    change_column :tweets_twitter_lists, :updated_at, :datetime, {:null => true}

    change_column :members_twitter_lists, :created_at, :datetime, {:null => true}
    change_column :members_twitter_lists, :updated_at, :datetime, {:null => true}
  end

  def down
    change_column :tweets_twitter_lists, :created_at, :datetime, {:null => false}
    change_column :tweets_twitter_lists, :updated_at, :datetime, {:null => false}

    change_column :members_twitter_lists, :created_at, :datetime, {:null => false}
    change_column :members_twitter_lists, :updated_at, :datetime, {:null => false}
  end
end

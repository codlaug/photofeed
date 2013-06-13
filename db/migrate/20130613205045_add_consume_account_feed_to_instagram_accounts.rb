class AddConsumeAccountFeedToInstagramAccounts < ActiveRecord::Migration
  def change
    add_column :instagram_accounts, :consume_from_feed, :boolean
  end
end

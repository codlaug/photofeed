class RemovePods < ActiveRecord::Migration
  def up
		drop_table :pods
		drop_table :pod_twitter_lists
  end

  def down
		raise ActiveRecord::IrreversibleMigration
  end
end

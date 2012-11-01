class RemoveTweetServices < ActiveRecord::Migration
  def up
		drop_table :tweet_services
  end

  def down
		raise ActiveRecord::IrreversibleMigration
  end
end

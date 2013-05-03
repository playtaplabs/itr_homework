class DropAdminTable < ActiveRecord::Migration
  def up
  	drop_table :admins
  end

  def down
  	#I am not sure what this is doing. I copied it from a stackoverflow response
  	raise ActiveRecord::IrreversibleMigration
  end
end

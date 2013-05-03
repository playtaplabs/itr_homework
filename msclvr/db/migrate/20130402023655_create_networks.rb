class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :network_name
      t.string :owner_first_name
      t.string :owner_last_name

      t.timestamps
    end
  end
end

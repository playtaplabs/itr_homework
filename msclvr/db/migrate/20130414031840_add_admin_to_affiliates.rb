class AddAdminToAffiliates < ActiveRecord::Migration
  def self.up
    add_column :affiliates, :admin, :boolean, :default => false
  end

  def self.down
  	remove_column :affiliates, :admin
  end
end

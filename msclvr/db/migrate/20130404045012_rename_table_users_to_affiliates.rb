class RenameTableUsersToAffiliates < ActiveRecord::Migration
  def change
  	rename_table :users, :affiliates
  end
end

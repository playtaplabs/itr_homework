class AddColumnsToPromotions < ActiveRecord::Migration
  def up
  	add_column :promotions, :track_url, :string
  	add_column :promotions, :slug, :string
  	add_column :promotions, :short_url, :string
  	add_column :promotions, :short_url2, :string
  	add_column :promotions, :custom_ending, :string
  end

  def down
  	remove_column :promotions, :track_url, :string
  	remove_column :promotions, :slug, :string
  	remove_column :promotions, :short_url, :string
  	remove_column :promotions, :short_url2, :string
  	remove_column :promotions, :custom_ending, :string
  end
end

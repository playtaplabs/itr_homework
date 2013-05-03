class AddUrlToShorturl < ActiveRecord::Migration
  def self.up
  	add_column :short_urls, :short_url2, :string
  end

  def self.down
  	remove_column :short_urls, :short_url2, :string
  end
end

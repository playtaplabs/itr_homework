class DropShorturls < ActiveRecord::Migration
  def up
  	drop_table :short_urls
  end

  def down
  end
end

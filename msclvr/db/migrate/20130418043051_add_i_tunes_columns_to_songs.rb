class AddITunesColumnsToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :track_name, :string
    add_column :songs, :artist_name, :string
    add_column :songs, :track_price, :string
    add_column :songs, :artworkurl100, :string
    add_column :songs, :viewurl, :string
    add_column :songs, :previewurl, :string
  end
end

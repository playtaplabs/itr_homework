class AddTrackUrlToSongs < ActiveRecord::Migration
  def change
  	add_column :songs, :track_url, :string
  end
end

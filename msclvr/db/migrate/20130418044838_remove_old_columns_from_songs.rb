class RemoveOldColumnsFromSongs < ActiveRecord::Migration
  def up
  	remove_column :songs, :song_title
    remove_column :songs, :song_performer
  end

  def down
  	add_column :songs, :song_title
    add_column :songs, :song_performer
  end
end

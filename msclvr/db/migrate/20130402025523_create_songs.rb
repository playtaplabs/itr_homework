class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :song_title
      t.string :song_performer

      t.timestamps
    end
  end
end

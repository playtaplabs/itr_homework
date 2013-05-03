class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.string :affiliate_id
      t.string :promotion_id
      t.string :song_id
      t.string :track_url
      t.string :slug
      t.string :short_url

      t.timestamps
    end
  end
end

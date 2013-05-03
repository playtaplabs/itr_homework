class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.integer :affiliate_id
      t.integer :song_id

      t.timestamps
    end
  end
end

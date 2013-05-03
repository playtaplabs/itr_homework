class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :promotion_id
      t.string :url
      t.string :slug

      t.timestamps
    end
  end
end

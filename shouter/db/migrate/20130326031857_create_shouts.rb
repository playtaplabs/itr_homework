class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end

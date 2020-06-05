class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string :name, null: false
      t.string :image_id
      t.text :description
      t.integer :price, null: false
      t.boolean :is_sold, null: false, default: true

      t.timestamps
    end
  end
end

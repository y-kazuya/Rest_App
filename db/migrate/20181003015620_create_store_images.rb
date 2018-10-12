class CreateStoreImages < ActiveRecord::Migration[5.1]
  def change
    create_table :store_images do |t|
      t.string :image
      t.integer :type

      t.references :store, foreign_key: true
      t.timestamps
    end
    add_index :store_images,[:store_id,:image]
  end
end

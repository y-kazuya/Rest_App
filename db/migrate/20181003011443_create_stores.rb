class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name,  null: false, index: true, unique: true
      t.integer :type, null: false
      t.integer :ken, null: false
      t.string :adrres
      t.string :kibo
      t.integer :seki
      t.text :profile
      t.references  :owner, foreign_key: true
      t.timestamps
    end
  end
end

class CreateOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :owners do |t|
      t.string :name,  null: false, default: ""
      t.string :email,              null: false, default: ""
      t.string :avatar
      t.integer :age
      t.integer :phone_number
      t.text :profile
      t.string :born



      t.timestamps
    end
    add_index :owners, :name, unique: true
    add_index :owners, :email,  unique: true
    add_index :owners, :phone_number,  unique: true
  end
end

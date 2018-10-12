class CreateStoreHolidays < ActiveRecord::Migration[5.1]
  def change
    create_table :store_holidays do |t|
      t.references :store, foreign_key: true
      t.references :holiday, foreign_key: true
      t.timestamps
    end
    add_index :store_holidays,[:store_id,:holiday_id]
  end
end

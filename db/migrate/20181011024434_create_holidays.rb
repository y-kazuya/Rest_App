class CreateHolidays < ActiveRecord::Migration[5.1]
  def change
    create_table :holidays do |t|
      t.integer :holi
      t.timestamps
    end
  end
end

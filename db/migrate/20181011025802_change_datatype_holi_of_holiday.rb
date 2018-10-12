class ChangeDatatypeHoliOfHoliday < ActiveRecord::Migration[5.1]
  def change
    change_column :holidays, :holi, :string
  end
end

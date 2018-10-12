class AddDetailsToStores < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :working_time, :string
  end
end

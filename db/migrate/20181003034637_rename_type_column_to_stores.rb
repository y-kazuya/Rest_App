class RenameTypeColumnToStores < ActiveRecord::Migration[5.1]
  def change
    rename_column :stores, :type, :cate
  end
end

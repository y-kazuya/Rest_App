class RenameTypeColumnToStoreImages < ActiveRecord::Migration[5.1]
  def change
    rename_column :store_images, :type, :status
  end
end

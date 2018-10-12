class RenamneTags < ActiveRecord::Migration[5.1]
  def change
    rename_table :store_tags, :stores_tags
  end
end

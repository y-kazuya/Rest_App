class AddPasswordDigestToOwners < ActiveRecord::Migration[5.1]
  def change
    add_column :owners, :password_digest, :string
  end
end

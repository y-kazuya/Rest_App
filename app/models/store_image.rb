class StoreImage < ApplicationRecord
  belongs_to :store

  mount_uploader :image, StoreImageUploader
end

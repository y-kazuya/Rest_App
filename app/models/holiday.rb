class Holiday < ApplicationRecord
  has_many :store_holidays
  has_many :stores, through: :store_holidays
end

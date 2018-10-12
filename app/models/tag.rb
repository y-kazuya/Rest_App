class Tag < ApplicationRecord
  has_and_belongs_to_many :stores

  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true
end

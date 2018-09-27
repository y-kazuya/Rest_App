class Owner < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 50 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :profile,length: { maximum: 500 }
  validates :born,length: { maximum: 100 }
  validates :age, numericality: {less_than_or_equal_to: 100}
  validates :phone_number , uniqueness: true: {less_than_or_equal_to: 9999999999999}


end
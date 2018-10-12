class StoreHoliday < ApplicationRecord
  belongs_to :store, optional: true
  belongs_to :holiday, optional: true
end

class Realtor < ApplicationRecord
  has_many :nearest_stations
  validates :house, presence: true
  validates :price,presence: true
  validates :address,presence: true
  validates :age,presence: true, length: { maximum: 3 }
  validates :remarkes,presence: true
  accepts_nested_attributes_for :nearest_stations, allow_destroy: true, reject_if: :all_blank
end

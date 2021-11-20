class Studio < ApplicationRecord
  validates :name, uniqueness: true
  validates :country, presence: true
end

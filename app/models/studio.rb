class Studio < ApplicationRecord
  validates :name, uniqueness: true
end

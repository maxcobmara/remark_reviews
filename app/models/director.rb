class Director < ApplicationRecord
  validates :name, uniqueness: true
  has_many :movies
end

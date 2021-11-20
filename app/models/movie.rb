class Movie < ApplicationRecord
  belongs_to :director
  has_many :film_locations
end

class Movie < ApplicationRecord
  belongs_to :director
  has_many :film_locations
  has_many :movie_actors
  has_many :reviews
end

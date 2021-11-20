class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  validates :name, presence: true
  validates :name, uniqueness: true
end

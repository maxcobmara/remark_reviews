class FilmLocation < ApplicationRecord
  belongs_to :movie
  belongs_to :studio
end

class Actor < ApplicationRecord
  validates :name, uniqueness: true
end

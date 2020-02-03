class Shelter < ApplicationRecord
  validates_presence_of :name
  has_many :pets
end

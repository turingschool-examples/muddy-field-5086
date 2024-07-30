class Mechanic < ApplicationRecord
  has_many :amusement_park_mechanics
  has_many :amusement_parks, through: :amusement_park_mechanics
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

end
class AmusementPark < ApplicationRecord
  has_many :rides
  has_many :mechanics
  has_many :amusement_park_mechanics
  has_many :mechanics, through: :amusement_park_mechanics

  def park_mechanics
    
    # self.joins(rides: :mechanics).select(:mechanics).where("mechanics.rides.id = amusement_park.rides").distinct
  end
end
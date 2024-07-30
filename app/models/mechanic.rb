class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def current_rides
    # Want all rides associated with this mechanic
    # This works due to associations (has_many :rides)
    rides
  end
end


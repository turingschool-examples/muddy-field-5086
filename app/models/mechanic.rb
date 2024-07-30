class Mechanic < ApplicationRecord
  has_many :mechanic_rides
  has_many :rides, through: :mechanic_rides

  def mechanic_rides
    rides.where(mechanic_id: self.id)
  end
end
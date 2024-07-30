class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics


  # Pretty sure I didn't need a model method for this
  # But I got hung up and this was the easiest solution
  # Couldn't I just call `rides` directly on `mechanic`??
  def current_rides
    # Want all rides associated with this mechanic
    # This works due to associations (has_many :rides)
    rides
  end
end


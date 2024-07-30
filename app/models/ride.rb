class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.ordered_by_mechanic
    joins(:mechanics)
    .select("rides.*, avg(mechanics.years_experience) AS average_experience")
    .group("rides.id")
    .order("average_experience desc")
  end
end
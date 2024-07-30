class AmusementParkMechanic < ApplicationRecord
  belongs_to :mechanic
  belongs_to :amusement_park
end
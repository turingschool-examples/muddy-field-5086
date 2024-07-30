class RemoveMechanicsFromAmusementParks < ActiveRecord::Migration[7.1]
  def change
    remove_reference :amusement_park, :mechanics, foreign_key: true
  end
end

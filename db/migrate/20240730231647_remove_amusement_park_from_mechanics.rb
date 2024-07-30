class RemoveAmusementParkFromMechanics < ActiveRecord::Migration[7.1]
  def change
    remove_reference :mechanics, :amusement_park, foreign_key: true
  end
end

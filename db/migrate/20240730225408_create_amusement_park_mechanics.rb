class CreateAmusementParkMechanics < ActiveRecord::Migration[7.1]
  def change
    create_table :amusement_park_mechanics do |t|
      t.references :mechanic, null: false, foreign_key: true
      t.references :amusement_park, null: false, foreign_key: true

      t.timestamps
    end
  end
end

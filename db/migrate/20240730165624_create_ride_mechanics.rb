class CreateRideMechanics < ActiveRecord::Migration[7.1]
  def change
    create_table :ride_mechanics do |t|
      t.references :ride, null: false, foreign_key: true
      t.references :mechanics, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateRides < ActiveRecord::Migration[7.0]
  def change
    create_table :rides do |t|
      t.string :name
      t.integer :thrill_rating
      t.boolean :open
      t.references :amusement_park, null: false, foreign_key: true

      t.timestamps
    end
  end
end

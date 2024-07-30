require "rails_helper"

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it { should have_many(:ride_mechanics) }
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe "model methods" do
    it "returns rides a mechanic is assigned to" do
      mechanic_1 = Mechanic.create!(name: "Jim Bob")

      six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

      hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

      RideMechanic.create!(ride_id: hurler.id, mechanic_id: mechanic_1.id)
      RideMechanic.create!(ride_id: scrambler.id, mechanic_id: mechanic_1.id)
      RideMechanic.create!(ride_id: ferris.id, mechanic_id: mechanic_1.id)

      expect(mechanic_1.current_rides.sort).to eq([hurler, scrambler, ferris].sort)
    end
  end
end
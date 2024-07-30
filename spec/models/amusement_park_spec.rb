require "rails_helper"

RSpec.describe AmusementPark, type: :model do
  describe "relationships" do
    it { should have_many(:rides) }
    it { should have_many(:mechanics).through(:rides) }
  end

  before(:each) do
    @mechanic1 = Mechanic.create!(name: "Fred", years_experience: 5)
    @mechanic2 = Mechanic.create!(name: "Shaggy", years_experience: 2)
    @mechanic3 = Mechanic.create!(name: "Velma", years_experience: 10)

    @amusement_park1 = AmusementPark.create!(name: "Seven Flags", admission_cost: 50)
    @amusement_park2 = AmusementPark.create!(name: "Blackbeard's Cave", admission_cost: 25)
    @amusement_park3 = AmusementPark.create!(name: "Jenkinson's Boardwalk", admission_cost: 25)

    @ride1 = Ride.create(name: "Himalaya", thrill_rating: 7, open: true, amusement_park_id: @amusement_park1.id)
    @ride2 = Ride.create(name: "Ferris Wheel", thrill_rating: 3, open: true, amusement_park_id: @amusement_park1.id)
    @ride3 = Ride.create(name: "Fun House", thrill_rating: 5, open: false, amusement_park_id: @amusement_park1.id)
    
    @ride4 = Ride.create(name: "Moby Dick", thrill_rating: 8, open: true, amusement_park_id: @amusement_park2.id)
    @ride5 = Ride.create(name: "Tower of DOOM", thrill_rating: 6, open: true, amusement_park_id: @amusement_park2.id)
    @ride6 = Ride.create(name: "The Zipper", thrill_rating: 10, open: false, amusement_park_id: @amusement_park2.id)

    RideMechanic.create!(ride_id: @ride1.id, mechanic_id: @mechanic1.id)
    RideMechanic.create!(ride_id: @ride2.id, mechanic_id: @mechanic3.id)
    RideMechanic.create!(ride_id: @ride3.id, mechanic_id: @mechanic1.id)
    RideMechanic.create!(ride_id: @ride4.id, mechanic_id: @mechanic2.id)
    RideMechanic.create!(ride_id: @ride6.id, mechanic_id: @mechanic2.id)
  end

  describe "instance methods" do
    it "unique_mechanics" do
      expect(@amusement_park1.unique_mechanics).to eq([@mechanic1, @mechanic3])
      expect(@amusement_park2.unique_mechanics).to eq([@mechanic2])
      expect(@amusement_park3.unique_mechanics).to eq([])
    end
  end
end
require "rails_helper"

RSpec.describe Ride, type: :model do
  describe "relationships" do
    it { should belong_to(:amusement_park) }
    it { should have_many :ride_mechanics }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end

  before(:each) do
    @mechanic1 = Mechanic.create!(name: "Fred", years_experience: 5)
    @mechanic2 = Mechanic.create!(name: "Shaggy", years_experience: 2)
    @mechanic3 = Mechanic.create!(name: "Velma", years_experience: 10)
    @mechanic4 = Mechanic.create!(name: "Daphne", years_experience: 14)

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
    RideMechanic.create!(ride_id: @ride1.id, mechanic_id: @mechanic4.id)

    RideMechanic.create!(ride_id: @ride2.id, mechanic_id: @mechanic3.id)
    RideMechanic.create!(ride_id: @ride2.id, mechanic_id: @mechanic4.id)

    RideMechanic.create!(ride_id: @ride3.id, mechanic_id: @mechanic1.id)

    RideMechanic.create!(ride_id: @ride4.id, mechanic_id: @mechanic2.id)
    RideMechanic.create!(ride_id: @ride4.id, mechanic_id: @mechanic4.id)

    RideMechanic.create!(ride_id: @ride5.id, mechanic_id: @mechanic4.id)

    RideMechanic.create!(ride_id: @ride6.id, mechanic_id: @mechanic2.id)
    RideMechanic.create!(ride_id: @ride6.id, mechanic_id: @mechanic3.id)
    RideMechanic.create!(ride_id: @ride6.id, mechanic_id: @mechanic4.id)
  end

  describe "class methods" do
    it "self.ordered_by_mechanic" do
      expect(@amusement_park1.rides.ordered_by_mechanic).to eq([@ride2, @ride1, @ride3])
      expect(@amusement_park2.rides.ordered_by_mechanic).to eq([@ride5, @ride6, @ride4])
    end
  end
end
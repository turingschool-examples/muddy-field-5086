require "rails_helper"

RSpec.describe "the amusement park show page" do
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

  it "displays the park's attributes and a unique list of its mechanics" do
    visit amusement_park_path(@amusement_park1.id)

    expect(page).to have_content("Park: #{@amusement_park1.name}")
    expect(page).to have_content("Price of Admission: $#{@amusement_park1.admission_cost}")

    within("#park_mechanics") do
      expect(page).to have_content(@mechanic1.name)
      expect(page).to have_content(@mechanic3.name)
    end
  end

  it "displays another park's attributes and a unique list of its mechanics" do
    visit amusement_park_path(@amusement_park2.id)

    expect(page).to have_content("Park: #{@amusement_park2.name}")
    expect(page).to have_content("Price of Admission: $#{@amusement_park2.admission_cost}")

    within("#park_mechanics") do
      expect(page).to have_content(@mechanic2.name)
      expect(page).to_not have_content(@mechanic1.name)
      expect(page).to_not have_content(@mechanic3.name)
    end
  end

  it "displays another park's attributes and a unique list of its mechanics" do
    visit amusement_park_path(@amusement_park3.id)

    expect(page).to have_content("Park: #{@amusement_park3.name}")
    expect(page).to have_content("Price of Admission: $#{@amusement_park3.admission_cost}")

    within("#park_mechanics") do
      expect(page).to_not have_content(@mechanic1.name)
      expect(page).to_not have_content(@mechanic2.name)
      expect(page).to_not have_content(@mechanic3.name)
    end
  end
end
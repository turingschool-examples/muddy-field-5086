require "rails_helper"

RSpec.describe "the mechanic show page" do
  before(:each) do
    @mechanic1 = Mechanic.create!(name: "Fred", years_experience: 5)
    @mechanic2 = Mechanic.create!(name: "Shaggy", years_experience: 2)
    @mechanic3 = Mechanic.create!(name: "Velma", years_experience: 10)

    @amusement_park1 = AmusementPark.create!(name: "Seven Flags", admission_cost: 50)
    @amusement_park2 = AmusementPark.create!(name: "Blackbeard's Cave", admission_cost: 25)

    @ride1 = Ride.create(name: "Himalaya", thrill_rating: 7, open: true, amusement_park_id: @amusement_park1.id)
    @ride2 = Ride.create(name: "Ferris Wheel", thrill_rating: 3, open: true, amusement_park_id: @amusement_park1.id)
    @ride3 = Ride.create(name: "Fun House", thrill_rating: 5, open: false, amusement_park_id: @amusement_park1.id)
    
    @ride4 = Ride.create(name: "Moby Dick", thrill_rating: 8, open: true, amusement_park_id: @amusement_park2.id)
    @ride5 = Ride.create(name: "Tower of DOOM", thrill_rating: 6, open: true, amusement_park_id: @amusement_park2.id)
    @ride6 = Ride.create(name: "The Zipper", thrill_rating: 10, open: false, amusement_park_id: @amusement_park2.id)

    RideMechanic.create!(ride_id: @ride1.id, mechanic_id: @mechanic1.id)
    RideMechanic.create!(ride_id: @ride3.id, mechanic_id: @mechanic1.id)
    RideMechanic.create!(ride_id: @ride4.id, mechanic_id: @mechanic2.id)
    RideMechanic.create!(ride_id: @ride6.id, mechanic_id: @mechanic2.id)
  end

  it "displays the mechanic's attributes and all of the rides they've worked on" do
    visit mechanic_path(@mechanic1.id)

    expect(page).to have_content("Name: #{@mechanic1.name}")
    expect(page).to have_content("Years of Experience: #{@mechanic1.years_experience}")
    
    within("#mechanic_rides") do
      expect(page).to have_content(@ride1.name)
      expect(page).to have_content(@ride3.name)
      expect(page).to_not have_content(@ride2.name)
      expect(page).to_not have_content(@ride4.name)
      expect(page).to_not have_content(@ride5.name)
      expect(page).to_not have_content(@ride6.name)
    end
  end

  it "displays another mechanic's attributes and all of the rides they've worked on" do
    visit mechanic_path(@mechanic2.id)

    expect(page).to have_content("Name: #{@mechanic2.name}")
    expect(page).to have_content("Years of Experience: #{@mechanic2.years_experience}")
    
    within("#mechanic_rides") do
      expect(page).to have_content(@ride4.name)
      expect(page).to have_content(@ride6.name)
      expect(page).to_not have_content(@ride1.name)
      expect(page).to_not have_content(@ride2.name)
      expect(page).to_not have_content(@ride3.name)
      expect(page).to_not have_content(@ride5.name)
    end
  end

  it "displays another mechanic's attributes and all of the rides they've worked on" do
    visit mechanic_path(@mechanic3.id)

    expect(page).to have_content("Name: #{@mechanic3.name}")
    expect(page).to have_content("Years of Experience: #{@mechanic3.years_experience}")
    
    within("#mechanic_rides") do
      expect(page).to_not have_content(@ride1.name)
      expect(page).to_not have_content(@ride2.name)
      expect(page).to_not have_content(@ride3.name)
      expect(page).to_not have_content(@ride4.name)
      expect(page).to_not have_content(@ride5.name)
      expect(page).to_not have_content(@ride6.name)
    end
  end
end
require 'rails_helper'

RSpec.describe "Mechanic Show Page" do
  before :each do
    @amusement_park = AmusementPark.create!(name: "Fun Plex", admission_cost: 10)
    
    @mechanic_1 = Mechanic.create!(name: "Jack", years_experience: 10)
    @mechanic_2 = Mechanic.create!(name: "Jill", years_experience: 20)

    @ride_1 = Ride.create!(name: "Twister", thrill_rating: 7, open: true, amusement_park: @amusement_park)
    @ride_2 = Ride.create!(name: "Tea Cups", thrill_rating: 4, open: true, amusement_park: @amusement_park)
    @ride_3 = Ride.create!(name: "El Diablo", thrill_rating: 9, open: false, amusement_park: @amusement_park)
    @ride_4 = Ride.create!(name: "Log Ride", thrill_rating: 5, open: false, amusement_park: @amusement_park)

    @mech_ride_1 = MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_1)
    @mech_ride_1 = MechanicRide.create!(mechanic: @mechanic_1, ride: @ride_2)
    @mech_ride_2 = MechanicRide.create!(mechanic: @mechanic_2, ride: @ride_3)
  end
  
  # User Story 1
  it "displays their name, years of experience, and the names of all rides they are working on." do
    visit "/mechanics/#{@mechanic_1.id}"
    
    
    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.years_experience)
    expect(page).to have_content(@ride_1.name)
    expect(page).to have_content(@ride_2.name)

    expect(page).to_not have_content(@mechanic_2.name)
    expect(page).to_not have_content(@mechanic_2.years_experience)
    expect(page).to_not have_content(@ride_3.name)
  end

  # User Story 2
  it "can add a ride to a mechanic" do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content("Add ride to Workload")
    expect(page).to have_field("Ride Id")

    fill_in "Ride Id", with: @ride_4.id
    click_button "Submit"

    expect(current_path).to eq "/mechanics/#{@mechanic_1.id}"
    expect(page).to have_content(@ride_4.name)
  end
end
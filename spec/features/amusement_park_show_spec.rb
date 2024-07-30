require 'rails_helper'

RSpec.describe "Amusement Park Show Page" do
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

  # User Story 3
  it "displays the name and price for that amusement park" do
    visit "/amusement_parks/#{@amusement_park.id}"

    expect(page).to have_content(@amusement_park.name)
    expect(page).to have_content(@amusement_park.admission_cost)   
  end

end
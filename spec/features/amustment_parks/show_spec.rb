require 'rails_helper'

RSpec.describe "Amustment Park show page" do 
  it "can display all attributes" do 
    @amusement_park = AmusementPark.create!(name: "Six Flags", admission_cost: 100)

    @ride_1 = @amusement_park.rides.create!(name: "Viper", thrill_rating: 7, open: true)
    @ride_2 = @amusement_park.rides.create!(name: "Superman", thrill_rating: 9, open: true)
    @ride_3 = @amusement_park.rides.create!(name: "Batman", thrill_rating: 8, open: true)
    @ride_4 = @amusement_park.rides.create!(name: "Ninja", thrill_rating: 3, open: true)

    @mechanic_1 = Mechanic.create!(name: "Millie Diane", years_experience: 3)
    @mechanic_2 = Mechanic.create!(name: "Leah Banana", years_experience: 1)

    RideMechanic.create!(ride: @ride_1, mechanic: @mechanic_1)
    RideMechanic.create!(ride: @ride_2, mechanic: @mechanic_1)
    RideMechanic.create!(ride: @ride_3, mechanic: @mechanic_2)
    RideMechanic.create!(ride: @ride_4, mechanic: @mechanic_2)

    visit amusement_park_path(@amusement_park)

    expect(page).to have_content(@amusement_park.name)
    expect(page).to have_content(@amusement_park.admission_cost)
  
  end
end
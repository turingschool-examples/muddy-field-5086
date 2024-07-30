require 'rails_helper'

RSpec.describe "Mechanic show page" do 
  it "can display mechanic name, years of experience, name of all ride they are working on" do 
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

    visit mechanic_path(@mechanic_1)
save_and_open_page
    expect(page).to have_content("Name: #{@mechanic_1.name}")
    expect(page).to have_content("Years of Experience: #{@mechanic_1.years_experience}")

    within ".assigned-rides" do 
      expect(page).to have_content(@ride_1.name)
      expect(page).to have_content(@ride_2.name)
    end
    
  end
end

# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of all rides they are working on.
# end
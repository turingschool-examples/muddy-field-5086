require "rails_helper"

RSpec.describe "Mechanic Show Page:", type: :feature do
  before(:each) do
    @amusement_park1 = AmusementPark.create!(name: "There And Back Again", admission_cost: 333)

    @mechanic1 = Mechanic.create!(name: "Thorin", years_of_experience: 100)
    @mechanic2 = Mechanic.create!(name: "Balin", years_of_experience: 75)
    @mechanic3 = Mechanic.create!(name: "Bombur", years_of_experience: 50)

    @ride1 = Ride.create(name: "The Lonely Mountain Luge", thrill_rating: 8)
    @ride2 = Ride.create(name: "The Forest River Barrel Ride", thrill_rating: 6)
    @ride3 = Ride.create(name: "The Desolation of Smaug", thrill_rating: 10)
    
    @amusement_park1.mechanics << @mechanic1
    @amusement_park1.mechanics << @mechanic2
    @amusement_park1.mechanics << @mechanic3

    @mechanic1.rides << @ride1
    @mechanic1.rides << @ride3
    @mechanic2.rides << @ride2 
    @mechanic2.rides << @ride3
    @mechanic3.rides << @ride1
    @mechanic3.rides << @ride2
  end

  # Story 1 - Mechanic Show Page
  context "As a user" do
    describe "when I visit a mechanic show page" do
      it "I see their name, years of experience, and the names of all rides they are working on." do
        visit mechanic_path(@mechanic1)
        within "#mechanic_info" do
          expect(page).to have_content("Name: #{@mechanic1.name}")
          expect(page).to have_content("Years of Experience: #{@mechanic1.years_of_experience}")
          expect(page).to have_content("Rides: #{@ride1.name}, #{@ride3.name}")
          
          expect(page).to_not have_content("Name: #{@mechanic2.name}")
          expect(page).to_not have_content("Years of Experience: #{@mechanic2.years_of_experience}")
          expect(page).to_not have_content("Rides: #{@ride2.name}")
          
          expect(page).to_not have_content("Name: #{@mechanic3.name}")
          expect(page).to_not have_content("Years of Experience: #{@mechanic3.years_of_experience}")
        end
      end
    end
  end

#     # Story 2 - Add a Ride to a Mechanic
#   context "As a user" do
#     describe "When I go to a mechanic's show page" do
#       xit "I see a form to add a ride to their workload" do

#       end
#       xit "When I fill in that field with an id of an existing ride and click 'Submit', I am taken back to that mechanic's show page" do

#       end
#       xit "And I see the name of that newly added ride on this mechanic's show page." do

#       end
#     end
#   end   
end
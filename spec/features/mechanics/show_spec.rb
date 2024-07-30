require "rails_helper"

RSpec.describe "Mechanic Show Page", type: :feature do
  # USER STORY #1
  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
    
    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    
    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
    
    @mechanic_1 = Mechanic.create!(name: "Joe", years_experience: 7)

    RideMechanic.create!(ride_id: @hurler.id, mechanic_id: @mechanic_1.id)
    RideMechanic.create!(ride_id: @scrambler.id, mechanic_id: @mechanic_1.id)
    RideMechanic.create!(ride_id: @ferris.id, mechanic_id: @mechanic_1.id)
  end

  describe "When I visit a mechanic show page" do
    it "displays that mechanic's name, years of experience, and ride names their working on" do

      # When I visit a mechanic show page
      visit mechanic_path(@mechanic_1)

      # I see their name, years of experience, and the names of all rides they are working on.
      expect(page).to have_content("#{@mechanic_1.name}")
      expect(page).to have_content("#{@mechanic_1.years_experience}")
      expect(page).to have_content("#{@mechanic_1.current_rides.name}")
    end
  end

  # USER STORY #2
  describe "adding rides to mechanic workload" do
    it "displays a form to add a ride workload to that mechanic" do
      # When I go to a mechanic's show page
      visit mechanic_path(@mechanic_1)

      # I see a form to add a ride to their workload
      expect(page).to have_field("Add Ride")
      
      # When I fill in that field with an id of an existing ride and click Submit
      fill_in :add_ride, with: @jaws.id
      click_button "Submit"
      
      # I’m taken back to that mechanic's show page
      expect(current_path).to eq(mechanic_path(@mechanic_1))

      # And I see the name of that newly added ride on this mechanic's show page.
      expect(page).to have_content("#{@jaws.name}")
    end
  end
end


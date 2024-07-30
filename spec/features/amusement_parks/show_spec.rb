require "rails_helper"

RSpec.describe "Amusement Park Show Page", type: :feature do
  # USER STORY #3
  before :each do
  # LOTS OF SEED DATA HERE
  @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
  @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
  
  @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
  @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
  @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
  
  @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

  @mechanic_1 = Mechanic.create!(name: "Jim Bob", years_experience: 3)
  @mechanic_2 = Mechanic.create!(name: "Leeroy", years_experience: 6)
  @mechanic_3 = Mechanic.create!(name: "Horace", years_experience: 4)
  @mechanic_4 = Mechanic.create!(name: "Kermit", years_experience: 8)

  RideMechanic.create!(ride_id: @hurler.id, mechanic_id: @mechanic_1.id)
  RideMechanic.create!(ride_id: @scrambler.id, mechanic_id: @mechanic_1.id)
  RideMechanic.create!(ride_id: @ferris.id, mechanic_id: @mechanic_1.id)
  
  RideMechanic.create!(ride_id: @hurler.id, mechanic_id: @mechanic_2.id)
  RideMechanic.create!(ride_id: @scrambler.id, mechanic_id: @mechanic_2.id)
  RideMechanic.create!(ride_id: @ferris.id, mechanic_id: @mechanic_2.id)

  RideMechanic.create!(ride_id: @jaws.id, mechanic_id: @mechanic_3.id)
  RideMechanic.create!(ride_id: @jaws.id, mechanic_id: @mechanic_4.id)

  end

  describe "visiting Six Flag's show page" do
    it "displays name and park admission fee for that park" do
      # As a visitor,
      # When I visit an amusement park’s show page,
      visit amusement_park_path(@six_flags)

      # Then I see the name and price of admissions for that amusement park
      expect(page).to have_content("Name: #{@six_flags.name}")
      expect(page).to have_content("Cost: #{@six_flags.admission_cost}")

      # And I see the names of all mechanics that are working on that park's rides,
        # UNCLEAR HOW TO ANCHOR THE TEXT WITH THE LIST OF ASSOCIATED MECHANICS' NAMES
      expect(page).to have_content("Bob")
      expect(page).to have_content("Leeroy")

      binding.pry
      # And I see that the list of mechanics is unique
        # I KNOW THIS IS SUPPOSED TO BE AN AR QUERY, BUT I CANNOT FOR THE LIFE OF ME FIGURE IT OUT

    end
  end

  describe "visiting Universal's show page" do
    it "displays name and park admission fee for that park" do
      # As a visitor,
      # When I visit an amusement park’s show page,
      visit amusement_park_path(@universal)

      # Then I see the name and price of admissions for that amusement park
      expect(page).to have_content("Name: #{@universal.name}")
      expect(page).to have_content("Cost: #{@universal.admission_cost}")

      # And I see the names of all mechanics that are working on that park's rides,
        # UNCLEAR HOW TO ANCHOR THE TEXT WITH THE LIST OF ASSOCIATED MECHANICS' NAMES
      expect(page).to have_content("Horace")
      expect(page).to have_content("Kermit")
    end
  end
end
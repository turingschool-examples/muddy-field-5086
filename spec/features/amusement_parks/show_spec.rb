require "rails_helper"

RSpec.describe "the amusement park show" do

  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
    
    @ride1 = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @ride2 = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ride3 = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    
    @ride4 = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
    @ride5 = @universal.rides.create!(name: 'Jurrasic Park', thrill_rating: 8, open: true)
    
    @mechanic1 = Mechanic.create!(name: "Johny", years_experience: 10)
    @mechanic2 = Mechanic.create!(name: "Billy", years_experience: 5)
    
    @mechanic_ride1 = MechanicRide.create!(mechanic: @mechanic1, ride: @ride1)
    @mechanic_ride2 = MechanicRide.create!(mechanic: @mechanic1, ride: @ride2)
    @mechanic_ride3 = MechanicRide.create!(mechanic: @mechanic1, ride: @ride3)
    @mechanic_ride4 = MechanicRide.create!(mechanic: @mechanic2, ride: @ride4)
    @mechanic_ride5 = MechanicRide.create!(mechanic: @mechanic2, ride: @ride5)
    @mechanic_ride6 = MechanicRide.create!(mechanic: @mechanic1, ride: @ride4)
  end

  describe "As a visitor do" do
    describe "when I visit an amusement parks show page" do 
      it "displays the name and parice of admission for that amusement park" do
        visit amusement_park_path(@six_flags)

        expect(page).to have_content("Amusement Park #{@six_flags.id}")
        expect(page).to have_content("__#{@six_flags.name}__")
        expect(page).to have_content("Admission Cost: #{@six_flags.admission_cost}")
      end

      it "displays the unique names of all mechanics that are working on that park's rides" do
        visit amusement_park_path(@six_flags)

        expect(page).to have_content("Amusement Park #{@six_flags.id}")
        expect(page).to have_content("__#{@six_flags.name}__")
        expect(page).to have_content("Admission Cost: #{@six_flags.admission_cost}")

        expect(page).to have_content("Mechanics")
        expect(page).to have_content("")

      end
    end
  end
end


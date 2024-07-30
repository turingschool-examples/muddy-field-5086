require "rails_helper"

RSpec.describe "adding a ride to a mechanic" do
  before :each do
    @amusement_park = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @ride1 = @amusement_park.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    @ride2 = @amusement_park.rides.create!(name: "The Boardwalk", thrill_rating: 5, open: true)
    @ride3 = @amusement_park.rides.create!(name: "Superman", thrill_rating: 6, open: true)
    @mechanic = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    @mechanic.rides << @ride1
    @mechanic.rides << @ride2
  end

  it "should add a ride to the mechanic" do

    visit mechanic_path(@mechanic)
    
    expect(page).to have_content("The Hurler")
    expect(page).to have_content("The Boardwalk")
    expect(page).to_not have_content("Superman")
    
    fill_in "Ride Id", with: @ride3.id
    click_button "Submit"
    
    expect(current_path).to eq(mechanic_path(@mechanic))
    expect(page).to have_content("The Hurler")
    expect(page).to have_content("The Boardwalk")
    expect(page).to have_content("Superman")
  end
end
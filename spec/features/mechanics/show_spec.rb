require "rails_helper"

RSpec.describe "Mechanic Show Page" do
  before :each do
    @amusement_park = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @ride1 = @amusement_park.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    @ride2 = @amusement_park.rides.create!(name: "The Boardwalk", thrill_rating: 5, open: true)
    @mechanic = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    @mechanic.rides << @ride1
    @mechanic.rides << @ride2
  end

  it "should show the mechanic, their years of experience and, all the rides they're working on" do
    visit mechanic_path(@mechanic)

    expect(page).to have_content(@mechanic.name)
    expect(page).to have_content(@mechanic.years_experience)
    expect(page).to have_content(@ride1.name)
    expect(page).to have_content(@ride2.name)
  end
end
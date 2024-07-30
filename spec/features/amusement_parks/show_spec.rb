require " rails helper"

RSpec.describe "Amusement Park Show page" do
  before :each do
    @amusement_park = AmusementPark.create!(name: "Six Flags", admission_cost: 75)
    @ride1 = @amusement_park.rides.create!(name: "The Hurler", thrill_rating: 7, open: false)
    @ride2 = @amusement_park.rides.create!(name: "The Boardwalk", thrill_rating: 5, open: true)
    @ride3 = @amusement_park.rides.create!(name: "Fireball", thrill_rating: 9, open: true)
    @mechanic1 = Mechanic.create!(name: "Kara Smith", years_experience: 11)
    @mechanic2 = Mechanic.create!(name: "James Cameron", years_experience:7)

    @ride1.mechanics << @mechanic1
    @ride2.mechanics << @mechanic1
    @ride3.mechanics << @mechanic1
    @ride3.mechanics << @mechanic2
  end

  it "should show the amusement park information" do
    visit amusement_park_path(@amusement_park)

    expect(page).to have_content(@amusement_park.name)
    expect(page).to have_content(@amusement_park.admission_cost)
  end
  
  it "should show all the mechanics employed here in a unique list" do
    visit amusement_park_path(@amusement_park)

    expect(page).to have_content("Kara Smith", count: 1)
    expect(page).to have_content("James Cameron", count: 1)
  end
end
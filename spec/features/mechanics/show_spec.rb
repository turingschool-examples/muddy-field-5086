require 'rails_helper'

RSpec.describe "Mechanic Show Page", type: :feature do
  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)

    @mechanic = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
    @mechanic.rides << [@hurler, @scrambler]  # Associate mechanic with rides
  end

  it "displays the mechanic details and rides they are working on" do
    visit mechanic_path(@mechanic)

    expect(page).to have_content(@mechanic.name)
    expect(page).to have_content(@mechanic.years_experience)
    expect(page).to have_content(@hurler.name)
    expect(page).to have_content(@scrambler.name)
  end
end

require 'rails_helper'

RSpec.describe 'Amusement Park Show Page', type: :feature do
  before :each do
    @park = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @ride1 = @park.rides.create!(name: 'The Frog Hopper', thrill_rating: 5, open: true)
    @ride2 = @park.rides.create!(name: 'Fahrenheit', thrill_rating: 8, open: true)
    @mechanic1 = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
    @mechanic2 = Mechanic.create!(name: 'John Doe', years_experience: 5)
    @mechanic1.rides << @ride1
    @mechanic2.rides << @ride1
    @mechanic1.rides << @ride2
  end

  it 'shows the name and price of admissions for the park and a list of unique mechanics working on rides in the park' do
    visit amusement_park_path(@park)

    within('.amusement-park-info') do
      expect(page).to have_content(@park.name)
      expect(page).to have_content(@park.admission_cost)
    end

    within('.mechanics') do
      expect(page).to have_content(@mechanic1.name, count: 1)
      expect(page).to have_content(@mechanic2.name, count: 1)
    end
  end
end

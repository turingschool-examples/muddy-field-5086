require 'rails_helper'

RSpec.describe 'Mechanic Show Page', type: :feature do
  before :each do
    @park = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @ride1 = @park.rides.create!(name: 'The Frog Hopper', thrill_rating: 5, open: true)
    @ride2 = @park.rides.create!(name: 'Fahrenheit', thrill_rating: 8, open: true)
    @new_ride = @park.rides.create!(name: 'New Ride', thrill_rating: 7, open: true)
    @mechanic = Mechanic.create!(name: 'Kara Smith', years_experience: 11)
    @mechanic.rides << @ride1
    @mechanic.rides << @ride2
  end

  it 'shows the mechanic name, years of experience, and names of all rides they are working on' do
    visit mechanic_path(@mechanic)

    within('.mechanic-info') do
      expect(page).to have_content(@mechanic.name)
      expect(page).to have_content(@mechanic.years_experience)
    end

    within('.rides') do
      expect(page).to have_content(@ride1.name)
      expect(page).to have_content(@ride2.name)
    end
  end

  it 'has a form to add a ride to their workload' do
    visit mechanic_path(@mechanic)

    within('.add-ride-form') do
      fill_in 'ride_id', with: @new_ride.id
      click_button 'Submit'
    end

    expect(current_path).to eq(mechanic_path(@mechanic))

    @mechanic.reload

    within('.rides') do
      expect(page).to have_content(@new_ride.name)
    end
  end
end

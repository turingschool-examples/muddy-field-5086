require "rails_helper"

RSpec.describe "the amusement park show page" do
  before(:each) do
    @mechanic1 = Mechanic.create!(name: "Fred", years_experience: 5)
    @mechanic2 = Mechanic.create!(name: "Shaggy", years_experience: 2)
    @mechanic3 = Mechanic.create!(name: "Velma", years_experience: 10)
    @mechanic4 = Mechanic.create!(name: "Daphne", years_experience: 14)

    @amusement_park1 = AmusementPark.create!(name: "Seven Flags", admission_cost: 50)
    @amusement_park2 = AmusementPark.create!(name: "Blackbeard's Cave", admission_cost: 25)
    @amusement_park3 = AmusementPark.create!(name: "Jenkinson's Boardwalk", admission_cost: 25)

    @ride1 = Ride.create(name: "Himalaya", thrill_rating: 7, open: true, amusement_park_id: @amusement_park1.id)
    @ride2 = Ride.create(name: "Ferris Wheel", thrill_rating: 3, open: true, amusement_park_id: @amusement_park1.id)
    @ride3 = Ride.create(name: "Fun House", thrill_rating: 5, open: false, amusement_park_id: @amusement_park1.id)
    
    @ride4 = Ride.create(name: "Moby Dick", thrill_rating: 8, open: true, amusement_park_id: @amusement_park2.id)
    @ride5 = Ride.create(name: "Tower of DOOM", thrill_rating: 6, open: true, amusement_park_id: @amusement_park2.id)
    @ride6 = Ride.create(name: "The Zipper", thrill_rating: 10, open: false, amusement_park_id: @amusement_park2.id)

    RideMechanic.create!(ride_id: @ride1.id, mechanic_id: @mechanic1.id)
    RideMechanic.create!(ride_id: @ride1.id, mechanic_id: @mechanic4.id)

    RideMechanic.create!(ride_id: @ride2.id, mechanic_id: @mechanic3.id)
    RideMechanic.create!(ride_id: @ride2.id, mechanic_id: @mechanic4.id)

    RideMechanic.create!(ride_id: @ride3.id, mechanic_id: @mechanic1.id)

    RideMechanic.create!(ride_id: @ride4.id, mechanic_id: @mechanic2.id)
    RideMechanic.create!(ride_id: @ride4.id, mechanic_id: @mechanic4.id)

    RideMechanic.create!(ride_id: @ride5.id, mechanic_id: @mechanic4.id)

    RideMechanic.create!(ride_id: @ride6.id, mechanic_id: @mechanic2.id)
    RideMechanic.create!(ride_id: @ride6.id, mechanic_id: @mechanic3.id)
    RideMechanic.create!(ride_id: @ride6.id, mechanic_id: @mechanic4.id)
  end

  it "displays the park's attributes and a unique list of its mechanics" do
    visit amusement_park_path(@amusement_park1.id)

    expect(page).to have_content("Park: #{@amusement_park1.name}")
    expect(page).to have_content("Price of Admission: $#{@amusement_park1.admission_cost}")

    within("#park_mechanics") do
      expect(page).to have_content(@mechanic1.name)
      expect(page).to have_content(@mechanic3.name)
      expect(page).to have_content(@mechanic4.name)
    end
  end

  it "displays another park's attributes and a unique list of its mechanics" do
    visit amusement_park_path(@amusement_park2.id)

    expect(page).to have_content("Park: #{@amusement_park2.name}")
    expect(page).to have_content("Price of Admission: $#{@amusement_park2.admission_cost}")

    within("#park_mechanics") do
      expect(page).to have_content(@mechanic2.name)
      expect(page).to have_content(@mechanic3.name)
      expect(page).to have_content(@mechanic4.name)
      expect(page).to_not have_content(@mechanic1.name)
    end
  end

  it "displays another park's attributes and a unique list of its mechanics" do
    visit amusement_park_path(@amusement_park3.id)

    expect(page).to have_content("Park: #{@amusement_park3.name}")
    expect(page).to have_content("Price of Admission: $#{@amusement_park3.admission_cost}")

    within("#park_mechanics") do
      expect(page).to_not have_content(@mechanic1.name)
      expect(page).to_not have_content(@mechanic2.name)
      expect(page).to_not have_content(@mechanic3.name)
      expect(page).to_not have_content(@mechanic4.name)
    end
  end

  it "displays a list of the amusement park's rides in order of average mechanic experience level" do
    visit amusement_park_path(@amusement_park1.id)

    within("#park_rides") do
      expect(page).to have_content(@ride1.name)
      expect(page).to have_content(@ride2.name)
      expect(page).to have_content(@ride3.name)
    end

    ride1_experience = ((@mechanic1.years_experience + @mechanic4.years_experience) / 2)
    ride2_experience = ((@mechanic3.years_experience + @mechanic4.years_experience) / 2)
    ride3_experience = (@mechanic1.years_experience / 1)

    within("#ride-#{@ride1.id}") do
      expect(page).to have_content("Average Experience of Ride Mechanics: #{ride1_experience}")
    end

    within("#ride-#{@ride2.id}") do
      expect(page).to have_content("Average Experience of Ride Mechanics: #{ride2_experience}")
    end

    within("#ride-#{@ride3.id}") do
      expect(page).to have_content("Average Experience of Ride Mechanics: #{ride3_experience}")
    end
  end

  it "displays a list of another amusement park's rides in order of average mechanic experience level" do
    visit amusement_park_path(@amusement_park2.id)

    within("#park_rides") do
      expect(page).to have_content(@ride4.name)
      expect(page).to have_content(@ride5.name)
      expect(page).to have_content(@ride6.name)
    end

    ride4_experience = ((@mechanic2.years_experience + @mechanic4.years_experience) / 2)
    ride5_experience = (@mechanic4.years_experience / 1)
    ride6_experience = ((@mechanic2.years_experience + @mechanic3.years_experience + @mechanic4.years_experience) / 3)

    within("#ride-#{@ride4.id}") do
      expect(page).to have_content("Average Experience of Ride Mechanics: #{ride4_experience}")
    end

    within("#ride-#{@ride5.id}") do
      expect(page).to have_content("Average Experience of Ride Mechanics: #{ride5_experience}")
    end

    within("#ride-#{@ride6.id}") do
      expect(page).to have_content("Average Experience of Ride Mechanics: #{ride6_experience}")
    end
  end
end
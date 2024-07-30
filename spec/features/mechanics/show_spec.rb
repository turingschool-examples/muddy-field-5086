require "rails_helper"

RSpec.describe "Mechanic Show Page", type: :feature do
  # USER STORY #1
  describe "When I visit a mechanic show page" do
    it "displays that mechanic's name, years of experience, and ride names their working on" do
      mechanic = Mechanic.create(name: "Joe", years_experience: 7)

      # When I visit a mechanic show page
      visit "/mechanics/#{mechanic.id}"

      # I see their name, years of experience, and the names of all rides they are working on.
      expect(page).to have_content("#{mechanic.name}")
      expect(page).to have_content("#{mechanic.years_experience}")
      expect(page).to have_content("#{mechanic.current_rides}")
    end
  end
end
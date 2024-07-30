require "rails_helper"

RSpec.describe AmusementParkMechanic, type: :model do
  describe "relationships" do
    it { should belong_to(:amusement_park) }
    it { should belong_to(:mechanic) }
  end
end
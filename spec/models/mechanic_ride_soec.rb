require "rails_helper"

RSpec.describe MechanicRide do
  describe "association" do
    it { should belong_to(:mechanic) }
    it { should belong_to(:ride) }
  end
end
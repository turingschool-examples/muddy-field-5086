require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe "relationships" do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanics_rides) }
    it { should have_many(:rides) }
  end
end

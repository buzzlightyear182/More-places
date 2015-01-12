require 'rails_helper'

RSpec.describe Destination, :type => :model do

  before :each do
    Destination.destroy_all
    @destination = create(:destination)
  end

  describe "will only be created" do

    it "if no record exists" do
      new_destination = create(:destination, city: "Barcelona", country: "Spain")
      trip = create(:trip, destination: new_destination)
      expect(Destination.count).to eq(2)
    end

  end

  describe "will not be created" do

    it "if record exists" do
      trip = create(:trip, destination: @destination)
      expect(Destination.count).to eq(1)
    end

  end

end

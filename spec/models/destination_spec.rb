require 'rails_helper'

RSpec.describe Destination, :type => :model do

    it { should have_many(:trips) }

  before :each do
    Destination.destroy_all
    @destination = create(:destination)
  end

  describe "will only be created when" do

    it "no record exists" do
      new_destination = create(:destination, city: "Barcelona", country: "Spain")
      create(:trip, destination: new_destination)
      expect(Destination.count).to eq(2)
    end

  end

  describe "will not be created when" do

    it "a record already exists" do
      create(:trip, destination: @destination)
      expect(Destination.count).to eq(1)
    end

  end

end

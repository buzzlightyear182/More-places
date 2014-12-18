require 'rails_helper'

RSpec.describe Destination, :type => :model do

  before :each do
    Destination.destroy_all
    @destination = create(:destination)
  end

  describe "will only be created" do

    it "if no record exists" do
      new_destination = create(:destination, name: "Warner Bros Studios Harry Potter")
      experience = create(:experience, destination: new_destination)
      expect(Destination.count).to eq(2)
    end

  end

  describe "will not be created" do

    it "if record exists" do
      experience = create(:experience, destination: @destination)
      expect(Destination.count).to eq(1)
    end

  end

end

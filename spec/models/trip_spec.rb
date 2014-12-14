require 'rails_helper'

RSpec.describe Trip, :type => :model do

  describe "should be valid when it" do

    it "has all complete details" do
      trip = build(:trip)
      expect(trip).to be_valid
    end

    it "belongs to a user" do
      @user = create(:user)
      result = create(:trip, user: @user)
      expect(@user.trips).to eq(result)
    end

  end

  describe "should not be valid when it" do

    it "doesn't have a destination" do
      trip = build(:trip, destination: nil)
      expect(trip).to be_invalid
    end

  end
end
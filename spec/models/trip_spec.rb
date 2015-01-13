require 'rails_helper'

RSpec.describe Trip, :type => :model do

  it { should belong_to(:destination) }
  it { should belong_to(:user) }
  it { should belong_to(:activity) }

  it { should validate_presence_of(:destination) }
  it { should validate_presence_of(:activity) }
  it { should validate_presence_of(:from_date) }
  it { should validate_presence_of(:to_date) }

  describe "should be valid when it" do

    it "has all complete details" do
      trip = build(:trip)
      expect(trip).to be_valid
    end
  end

  describe "should not be valid when it" do

    it "from_date has passed" do
      trip = build(:trip, from_date: Date.today-1)
      expect(trip).to be_invalid
    end

    it "to_date is before from_date" do
      trip = build(:trip, from_date: Date.today+1, to_date: Date.today-1)
      expect(trip).to be_invalid
    end

  end

end

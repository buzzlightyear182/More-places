require 'rails_helper'

RSpec.describe Trip, :type => :model do

  it { should belong_to(:destination) }
  it { should belong_to(:organizer) }
  it { should belong_to(:activity) }

  it { should have_many(:participations) }
  it { should have_many(:confirmed_participations) }
  it { should have_many(:pending_participations) }

  it { should validate_presence_of(:organizer) }
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

  describe "when created" do

    it 'should automatically create a participation' do
      trip = create(:trip)
      expect(Participation.is_confirmed.last.trip_id).to eq(trip.id)
    end

  end

end

require 'rails_helper'

RSpec.describe Participation, :type => :model do

  it { should belong_to(:trip) }
  it { should belong_to(:user) }

  let (:trip) { create(:trip) }

  describe "is automatically confirmed when" do

    it "organizer creates a trip" do
      expect(trip.participations.first.confirmed?).to be true
    end
  end

  describe "is automatically on pending when" do

    let(:participant) { create(:user, username: 'participant') }
    let(:participation) { Participation.create( user_id: participant.id, trip_id: trip.id, confirmed?: false) }

    it "a participant joins a trip" do
      participation.reload
      expect(trip.participations.second.confirmed?).to be false
    end

  end

end

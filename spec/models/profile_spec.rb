require 'rails_helper'
require 'pry'

RSpec.describe Profile, type: :model do
  it { should belong_to(:user) }

  describe "when a user is created" do

    let (:user) { create(:user) }

    it "profile should be automatically generated" do
      expect(user.profile.id).to eq(user.id)
    end
  end

  describe "when a review is created" do

    let (:participant) { create(:participant) }
    let (:joiner) { create(:participation, user: participant) }
    let (:review) { Review.create(participation: joiner, author: joiner.trip.organizer, content: "This is a review", score: 10) }

    describe "and profile has no rating" do

      it "should update profile rating with same score" do
        review.reload
        expect(participant.profile.rating).to eq(10)
      end

    end

    describe "and profile already has a rating" do

      let (:second_participant) { create(:second_participant) }

      let (:second_joiner) { create(:participation, user: second_participant, trip: joiner.trip) }

      it "should update profile rating with average reviews score" do

        review.reload
        second_review = Review.create(participation: joiner, author: second_joiner.user, content: "This is another review", score: 6)

        expect(participant.profile.rating).to eq(8)
      end

    end

  end

end

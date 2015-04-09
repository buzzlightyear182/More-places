require 'rails_helper'

RSpec.describe Profile, type: :model do
  it { should belong_to(:user) }

  describe "will be automatically created when" do

    let (:user) { create(:user) }

    it "a user is created" do
      expect(user.profile.id).to eq(user.id)
    end
  end

  describe "Rating is updated" do

    let (:participant) { create(:participant) }
    let (:joiner) { create(:participation, user: participant) }
    let (:review) { Review.create(participation: joiner, author: joiner.trip.organizer, content: "This is a review", score: 10) }

    describe "with same review score when" do

      it "profile has no rating" do
        review.reload
        expect(participant.profile.rating).to eq(10)
      end

    end

    describe "by getting the average review score when" do

      let (:second_participant) { create(:second_participant) }

      let (:second_joiner) { create(:participation, user: second_participant, trip: joiner.trip) }

      it "profile already has an existing rating" do

        review.reload
        second_review = Review.create(participation: joiner, author: second_joiner.user, content: "This is another review", score: 6)

        expect(participant.profile.rating).to eq(8)
      end

    end

  end

end

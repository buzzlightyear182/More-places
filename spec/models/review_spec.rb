require 'rails_helper'

RSpec.describe Review, :type => :model do

  it { should belong_to(:participation) }
  it { should belong_to(:author) }

  let (:participant) { create(:participant) }
  let (:joiner) { create(:participation, user: participant) }

  describe "should only be valid when" do

    it "there are at least 2 members in a trip" do
      trip_members = joiner.trip.confirmed_participants
      # trip_members.each do |trip_member|
      #   puts trip_member.username
      # end
      expect(trip_members.count).to eq(2)
    end

    it "author and reviewer is part of same trip" do
      review = Review.create(participation: joiner, author: joiner.trip.organizer, content: "This is a review", score: 10)
      expect(review).to be_valid
    end

  end

  describe "should NOT be valid when" do

    it "author and reviewer are NOT part of same trip" do
      author = create(:author)
      review = Review.create(participation: joiner, author: author, content: "This is a review", score: 10)
      expect(review.errors.first).to eq([:author, "is not part of same trip with reviewee. Please check again."])
    end

  end

end

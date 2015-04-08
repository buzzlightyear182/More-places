class Review < ActiveRecord::Base
  belongs_to :participation, -> {is_confirmed}
  belongs_to :author, class_name: 'User'

  validates :content, presence: true
  validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  after_create :update_profile_rating

  validate :check_trip_members

  def reviewee
    participation.user
  end

  def check_trip_members
    if (check(author) && check(reviewee))
      return true
    else
      errors.add(:author, "is not part of same trip with reviewee. Please check again.")
    end
  end

  def check member
    participation.trip.confirmed_participants.include? member
  end

  private

  def update_profile_rating
    reviewee.profile.update_rating_with score
  end

end

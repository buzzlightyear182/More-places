class Review < ActiveRecord::Base
  belongs_to :participation, -> {is_confirmed}
  belongs_to :author, class_name: 'User'

  validates :content, presence: true
  validates :score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  after_create :update_rating

  validate :check_trip_members

  def check_trip_members
    if (check_author && check_reviewee)
      return true
    else
      errors.add(:author, "is not part of same trip with reviewee. Please check again.")
    end
  end

  def check_author
    participation.trip.confirmed_participants.include? author
  end

  def check_reviewee
    participation.trip.confirmed_participants.include? participation.user
  end

  private

  def update_rating
  #   if participation.user.profile.rating.nil?
  #     self.score = participation.user.profile.rating
  #   else
  #     participation.user.compute_average_rating
  #   end
  end

end

class Profile < ActiveRecord::Base
  belongs_to :user

  def update_rating_with score
    if rating.nil?
      update_attributes(rating: score)
    else
      compute_for_average
    end
  end

  def compute_for_average
    new_rating = user.reviews.average(:score).to_f
    update_attributes(rating: new_rating)
  end

end

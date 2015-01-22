module ParticipationsHelper
  def show_button_for participation
    if participation.trip.has_finished?
      button_to "Review", new_participation_review_path(:participation_id => participation.id), method: :get
    else
      button_to "Approve", confirm_participant_path(participation.id), method: :get
    end
  end

  def display_reviews_for participation
    unless participation.reviews.nil?
      render partial:'reviews/review', collection: participation.reviews
    end
  end

end

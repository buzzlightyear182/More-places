module ParticipationsHelper
  def show_button_for participation
    if participation.trip.has_finished?
      review_display_or_button participation
    else
      check_if_need_to_approve participation
    end
  end

  def review_display_or_button participation
    if participation.has_review_by current_user
      display_reviews_for participation
    else
      button_to "Review", new_participation_review_path(:participation_id => participation.id), method: :get
    end
  end

  def check_if_need_to_approve participation
    if participation.confirmed?
      return
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

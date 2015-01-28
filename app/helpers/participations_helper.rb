module ParticipationsHelper

  def show_button_for participation
    if participation.trip.has_finished?
      display_review_content_or_button_for participation
    else
      check_if_need_to_approve participation
    end
  end

  def display_review_content_or_button_for participation

    reviews = participation.has_review_by current_user

    if (reviews.count != 0) || (participation.user == current_user)
      display_reviews_for participation
    else
      button_to "Review", new_participation_review_path(:participation_id => participation.id), method: :get
    end
  end

  def check_if_need_to_approve participation
    unless participation.confirmed?
      button_to "Approve", confirm_participant_path(participation.id), method: :get
    end
  end

  def display_reviews_for participation
    unless participation.reviews.nil?
      render partial:'reviews/review', collection: participation.reviews
    end
  end


end

module TripsHelper

  def show_controls_for trip
    if trip.owner_is? current_user
      display_owner_controls_of trip
    else
      allow_join trip if trip.joinable_by? current_user
    end
  end

  def display_owner_controls_of trip
    allow_update(trip) + allow_destroy(trip)
  end

  def allow_update trip
    button_to "Update this trip", edit_trip_path(:id => trip.id), method: :get, :class => 'change'
  end

  def allow_destroy trip
    button_to "Cancel this", trip_path(:id => trip.id), method: :delete, data: { confirm: "Are you sure?" }, :class => 'change'
  end

  def allow_join trip
    button_to "Join trip", trip_participations_path(:trip_id => trip.id), method: :post, :class => 'change'
  end

  def display_confirmed_participants_of trip
    trip.confirmed_participants.map { |participant|
      link_to participant.username, ""
    }.join("<br/>").html_safe()
  end

  def display_pending_participants_of trip
    unless trip.pending_participants.nil?
      content_tag(:h5, "Pending: #{trip.pending_participants.count}")
    end
  end

  # def get_pending_participants_of trip
  #   trip.pending_participants.map { |participant|
  #       render partial: 'participant', object: participant
  #     }.join("<br/>").html_safe()
  # end

end

module TripsHelper
  def show_controls_for trip
    if current_user.trips.include? trip
      display_owner_controls_of trip
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

end
module DashboardHelper

  def display_trips trip_list
    unless trip_list.count == 0
      render partial:'dashboard/trip', collection: trip_list
    else
      content_tag(:p, "None on this list")
    end
  end

end

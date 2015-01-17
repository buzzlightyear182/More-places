class ParticipationsController < ApplicationController

  def create
    @trip = Trip.find(params[:trip_id])
    Participation.create!(trip_id: @trip.id, user_id: current_user.id, confirmed?: false)
    redirect_to trip_path(:id => @trip.id)
  end
end

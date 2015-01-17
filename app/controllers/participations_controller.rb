class ParticipationsController < ApplicationController

  def create
    trip = Trip.find(params[:trip_id])
    @participation = Participation.create!(trip_id: trip.id, user_id: current_user.id, confirmed?: false)
    SendConfirmation.to_notify_organizer(@participation).deliver
    flash[:notice] = "Organizer has been notified."
    redirect_to trip_path(:id => trip.id)
  end

  def update
    @participation =  Participation.find(params[:id])
    @participation.update_attributes!(confirmed?: true)
    SendConfirmation.to_notify_participant(@participation).deliver
    redirect_to trip_path(:id => @participation.trip.id)
  end
end

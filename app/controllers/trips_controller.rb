class TripsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.create trip_params
    if @trip.save
      flash[:success] = "Trip has been created!"
      redirect_to action: 'show', id: @trip.id
    else
      @errors = @trip.errors.full_messages
      flash[:error] = @errors.first
      redirect_to action: 'new'
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes trip_params
      flash[:success] = "Trip has been updated!"
      redirect_to action: 'show', id: @trip.id
    else
      @errors = @trip.errors.full_messages
      flash[:error] = @errors.first
      redirect_to action: 'edit'
    end
  end

  def destroy
    @trip = Trip.find(params[:id]).destroy
    redirect_to dashboard_path current_user
  end

  private

  def trip_params
    params.require(:trip).permit(:user_id, :destination_name, :activity_name, :google_places_id, :from_date, :to_date, :description, :capacity)
  end

  def to_partial_path
    'trips/trip'
  end

end

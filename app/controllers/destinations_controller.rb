class DestinationsController < ApplicationController

  def index
    @destinations = Destination.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: @destinations.map(&:name)
  end
end

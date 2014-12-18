class DestinationsController < ApplicationController

  def index
    @destinations = Destination.order(:name).where("name like ?", "%#{params[:term]}%")
    respond_to do |format|
      format.html
      format.json { render json: @destinations.map(&:name) }
    end
  end
end

class ActivitiesController < ApplicationController

  def index
    @activities = Activity.order(:name).where("name like ?", "%#{params[:term]}%")
    respond_to do |format|
      format.html
      format.json { render json: @activities.map(&:name) }
    end
  end

end

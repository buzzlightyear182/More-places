class ActivitiesController < ApplicationController

  def index
    @activities = Activity.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: @activities.map(&:name)
  end
end

class ExperiencesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.create experience_params
    if @experience.save
      flash[:success] = "Experience has been created!"
      redirect_to action: 'show', id: @experience.id
    else
      @errors = @experience.errors.full_messages
      flash[:error] = @errors.first
      redirect_to action: 'new'
    end
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def update
    @experience = Experience.find(params[:id])
    @experience.update_attributes experience_params
    redirect_to action: 'show', id: @experience.id
  end

  def destroy
    @experience = Experience.find(params[:id]).destroy
    redirect_to action: 'index'
  end

  private

  def experience_params
    params.require(:experience).permit(:user_id, :destination_name, :activity_name, :from_date, :to_date, :description, :capacity)
  end

  def to_partial_path
    'experiences/experience'
  end

end

class ProfilesController < ApplicationController

  before_action :authenticate_user!, except: [:show]

  def show
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update_attributes! profile_params
    if @profile.save
      flash[:success] = "Profile updated!"
      redirect_to action: 'show', id: @profile.id
    else
      @errors = @profile.errors.full_messages
      flash[:error] = @errors.first
      render 'edit'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:description)
  end


end

class ProfilesController < ApplicationController

  before_action :authenticate_user!, except: [:show]

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
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

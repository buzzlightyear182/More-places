class DashboardController < ApplicationController

  before_action :authenticate_user!

  def show
    @dashboard = Dashboard.new current_user
  end
end

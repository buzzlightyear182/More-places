require 'rails_helper'

RSpec.describe DashboardController, :type => :controller do

  before :each do
    login_user
  end

  describe "GET show" do
    it "returns http success" do
      get :show, id: @user.id
      expect(response).to have_http_status(:success)
    end
  end

end

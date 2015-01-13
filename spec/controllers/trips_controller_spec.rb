require 'rails_helper'

RSpec.describe TripsController, :type => :controller do

  before :each do
    login_user
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do
    it "returns http success" do
      trip = create(:trip)
      get :show, :id => trip.id
      expect(response).to have_http_status(:success)
    end
  end

end

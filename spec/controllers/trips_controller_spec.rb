require 'rails_helper'

RSpec.describe TripsController, :type => :controller do

  before :each do
    login_user
  end

  after :each do
    logout_user
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET show" do

    before :each do
      trip = create(:trip, organizer: @user)
      get :show, :id => trip.id
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    # it { should render_template('show') }
  end

end

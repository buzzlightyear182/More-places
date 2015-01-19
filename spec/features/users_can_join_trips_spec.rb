require 'rails_helper'
RSpec.describe "Joining trips", :type => :feature do

  before :each do
    login_with_email
    click_button 'Start your own trip'
    input_new_form_with("Test City, Test Country", "Dive")
  end

  feature 'Users can join a trip' do
    scenario 'on show trip page' do
      click_link 'Logout'
      login_participant
      trip = Trip.last
      visit trip_path(:id => trip.id)
      page.has_css?('input', :text => 'Join trip', :visible => true)
    end

    scenario 'by clicking Join trip' do
      click_link 'Logout'
      login_participant
      trip = Trip.last
      participant = User.last
      visit trip_path(:id => trip.id)
      click_on 'Join trip'
      expect(page).to have_content("Pending: 1")
    end
  end

  feature 'Users cannot join a trip' do
    scenario 'if they are the organizer' do
      expect(page).not_to have_content("Join trip")
      page.has_css?('input', :text => 'Update trip', :visible => true)
    end
  end

end

require 'rails_helper'

RSpec.describe "Join Trips", :type => :feature do

  before :each do
    login_with_username
    click_button 'Start your own trip'
    input_new_form_with("Test City, Test Country", "Dive")
  end

  feature 'Users can join a trip' do
    scenario 'on show trip page' do
      click_link 'Logout'
      sign_up_with 'joiner','joiner@example.com', 'password'
      visit '/trips'
      click_link 'Trip No'
      expect(page).to have_content("Join trip")
    end
  end

  feature 'Users cannot join a trip' do
    scenario 'if they are the organizer' do
      expect(page).not_to have_content("Join trip")
    end
  end

end

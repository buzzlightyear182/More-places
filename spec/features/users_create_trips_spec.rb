require 'rails_helper'

RSpec.describe "Create Trips", :type => :feature do

  before :each do
    login_with_username
    click_button 'Start your own trip'
  end

  after :each do
    click_link 'Logout'
  end

  feature 'Users can go to new Trips page' do
    scenario 'from dashboard' do
      expect(page).to have_content("Create a new trip!")
    end
  end

  feature 'Users can create new trips' do

    scenario 'successfully with complete details' do
      input_new_form_with("Test City, Test Country", "Dive")
      expect(page).to have_content('Going to Test City, Test Country')
    end

    scenario 'and edit the trips' do
      input_new_form_with("Test City, Test Country", "Dive")
      click_button "Update this trip"
      input_edit_form_with("Second City, Second Country", "Dive")
      expect(page).to have_content('Going to Second City, Second Country')
    end

    scenario 'and destroy trips' do
      input_new_form_with("Test City, Test Country", "Dive")
      click_button "Cancel this"
      expect(page).to have_content('Welcome,')
    end
  end

end

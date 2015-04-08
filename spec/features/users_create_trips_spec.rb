require 'rails_helper'

RSpec.describe "Create Trips", :type => :feature do

  before :each do
    login_with_username
    click_button 'Start your own trip'
  end

  # after :each do
  #   click_link 'Logout'
  # end

  feature 'Users can go to new Trips page' do
    scenario 'from dashboard' do
      expect(page).to have_content("Create a New Trip!")
    end
  end

  feature 'Users can create new trips' do

    scenario 'successfully with complete details' do
      input_new_form_with("Test City, Test Country", "Dive")
      expect(page).to have_content('Destination Test City, Test Country')
    end

    scenario 'and edit the trips' do
      input_new_form_with("Test City, Test Country", "Dive")
      click_button "Update"
      input_edit_form_with("Second City, Second Country", "Dive")
      expect(page).to have_content('Destination Second City, Second Country')
    end

    scenario 'and destroy trips' do
      input_new_form_with("Test City, Test Country", "Dive")
      click_button "Cancel"
      expect(page).to have_content('Upcoming Trips')
    end

  end

end

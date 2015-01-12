require 'rails_helper'

RSpec.describe "Create Trips", :type => :feature do

  before :each do
    login_with_username
    click_link 'Start your own trip'
  end

  feature 'Users can go to new Trips page' do
    scenario 'from dashboard' do
      expect(page).to have_content("Create a new trip!")
    end
  end

  feature 'Users can create new trips' do
    scenario 'successfully with complete details' do
      input_form_with("Test City, Test Country", "Dive")
      expect(page).to have_content('Going to Test City, Test Country')
    end
  end

end

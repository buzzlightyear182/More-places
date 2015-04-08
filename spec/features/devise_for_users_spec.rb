require 'rails_helper'

RSpec.describe "Added Devise for User Authentication", :type => :feature do

  feature 'New users can sign-up' do
    scenario 'with valid email and password' do
      sign_up_with 'username','valid@example.com', 'password'
      expect(page).to have_content('Logout')
      expect(page).to  have_content('Edit your profile')
    end
  end

  feature 'Existing users can login' do
    scenario 'using email and password' do
      login_with_email
      expect(page).to have_content('Upcoming Trips')
    end

    scenario 'using username and password' do
      login_with_username
      expect(page).to have_content('Upcoming Trips')
    end
  end

  feature 'Existing users can logout' do
    scenario 'when they are signed-in' do
      login_with_email
      click_link 'Logout'
      expect(page).to have_content('Login')
    end
  end

end

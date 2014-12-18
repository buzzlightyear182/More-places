require 'rails_helper'

RSpec.describe "Create new experiences", :type => :feature do

  xbefore :each do
    login_with_username
    create(:destination)
  end

  xfeature 'Destination is existing' do
    scenario 'will not create a new destination' do
      sign_up_with 'username','valid@example.com', 'password'
      expect(page).to have_content('Logout')
    end
  end

end

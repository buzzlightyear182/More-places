module Features
  module SessionHelpers

  def sign_up_with(username, email, password)
    visit new_user_registration_path
    fill_in 'Username', with: username
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
  end

  def login_with_email
    user = create(:user)
    visit new_user_session_path
    fill_in 'user_login', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  def login_with_username
    user = create(:user)
    visit new_user_session_path
    fill_in 'user_login', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  end

end

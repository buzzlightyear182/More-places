module ControllerMacros

  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create(:user)
    sign_in @user
  end

  def logout_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_out @user
  end
end

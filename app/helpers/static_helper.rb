module StaticHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def check_user_auth
    if user_signed_in?
      render 'refills/signed_in'
    else
      render 'refills/new_user'
    end
  end

end

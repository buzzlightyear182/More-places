class Dashboard

  def initialize user
    @user = user
  end

  def user
    @user.username
  end

  def confirmed_trips
    @user.confirmed_trips
  end

end

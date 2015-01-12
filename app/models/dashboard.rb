class Dashboard

  def initialize user
    @user = user
  end

  def user
    @user.username
  end

  def trips
    @user.trips
  end

end

class Dashboard

  def initialize user
    @user = user
  end

  def user
    @user.username
  end

  def experiences
    @user.experiences
  end

end

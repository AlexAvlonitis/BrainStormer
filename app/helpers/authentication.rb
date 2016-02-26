module CurrentUser

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def logged_in?
    unless current_user
      redirect '/'
    end
  end

end

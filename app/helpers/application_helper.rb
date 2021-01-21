module ApplicationHelper
  def logged_in?
    return true unless session[:user_id].nil?

    false
  end

  def current_user_id
    session[:user_id]
  end

  def current_user
    User.find(session[:user_id]) if isLoggedIn?
  end
end

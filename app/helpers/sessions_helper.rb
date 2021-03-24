module SessionsHelper

  def current_user(user_id)
    session[:user_id] == user_id
  end

  def logged_in?
    session[:user_id] != nil
  end

  def authorized?(user_id)
    current_user(user_id) && logged_in?
  end
end

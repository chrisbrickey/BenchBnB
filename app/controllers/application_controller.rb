class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def require_current_user!
    unless logged_in?
      redirect_to new_session_url
    end
  end

  def login!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def logged_in?
    if current_user
      return true
    else
      return false
    end
  end

  def logout
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

end

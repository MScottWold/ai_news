class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    !!self.current_user
  end

  def validate_login
    redirect_to new_admin_session_url unless self.logged_in?
  end
end

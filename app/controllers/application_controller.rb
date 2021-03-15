class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  def simulate_loading
    sleep(1.5)
  end

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

  def require_login
    unless logged_in?
      render json: { error: 'must be logged in' }, status: 400 
    end
  end

  def admin_logged_in?
    self.current_user.try(:admin)
  end

  def validate_admin_login
    redirect_to '/' unless self.admin_logged_in?
  end
end

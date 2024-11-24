module Admin
  module OAuthMethods
    def authenticate_admin_user!
      if current_admin_user.nil?
        redirect_to "/auth/google_oauth2"
      end
    end

    def current_admin_user
      @current_admin_user ||= find_user
    end

    def find_user
      if session[:oauth_token].present?
        User.find_by(oauth_token: session[:oauth_token])
      end
    end
  end
end

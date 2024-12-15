module Admin
  class OAuthSessionsController < ApplicationController
    def google
      if oauth_admin_user
        sign_in

        redirect_to admin_dashboard_path
      else
        redirect_to root_path
      end
    end

    def destroy
      oauth_token = session.delete(:oauth_token)
      User.find_by(oauth_token: oauth_token).reset_oauth_token!
      redirect_to root_path
    end

    private

    def sign_in
      session[:oauth_token] = oauth_token_digest
      oauth_admin_user.update(oauth_token: oauth_token_digest)
    end

    def oauth_admin_user
      @oauth_admin_user ||= User.find_by(email: user_email, admin: true)
    end

    def oauth_token_digest
      @oauth_token_digest ||= Digest::SHA2.hexdigest(authentication_hash.credentials.token)
    end

    def user_email
      authentication_hash.info.email
    end

    def authentication_hash
      request.env["omniauth.auth"]
    end
  end
end

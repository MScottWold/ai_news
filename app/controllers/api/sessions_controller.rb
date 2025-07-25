# frozen_string_literal: true

module Api
  class SessionsController < ApplicationController
    def create
      user = User.find_by_credentials(
        user_params[:username],
        user_params[:password],
      )

      if user
        login(user)

        render json: { username: user.username }
      else
        render json: { errors: ["Invalid Credentials"] }, status: 401
      end
    end

    def destroy
      logout!

      render json: { logout: true }
    end

    private

    def user_params
      params.require(:user).permit(:username, :password)
    end
  end
end

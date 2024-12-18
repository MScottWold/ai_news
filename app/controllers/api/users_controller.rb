module Api
  class UsersController < ApplicationController
    def create
      user = User.new(user_params)
      if user.save
        login(user)
        render json: { username: user.username }
      else
        render json: { errors: user.errors.full_messages }, status: 422
      end
    end

    private

    def user_params
      params.require(:user).permit(:username, :password)
    end
  end
end

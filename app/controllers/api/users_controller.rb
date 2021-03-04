class Api::UsersController < ApplicationController
  def create
    puts user_params
    user = User.new(user_params)

    if user.save
      login(user)
      render json: {username: user.username}
    else
      render json: user.errors.full_messages, status: 422
    end
  end

  private

  def user_params
    self.params.require(:user).permit(:username, :password)
  end
end
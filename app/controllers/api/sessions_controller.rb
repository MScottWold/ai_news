class Api::SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user
      login(user)
      render json: {username: user.username}
    else
      render json: ['Invalid Credentials'], status: 401
    end
  end

  def destroy
    self.logout!
  end
end
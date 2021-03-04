class Admin::SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:username],
      params[:password]
    )

    if user
      login(user)
      redirect_to new_admin_article_url
    else
      render json: ['Invalid Credentials'], status: 401
    end
  end

  def destroy
    self.logout!
    redirect_to new_admin_session_url
  end
end
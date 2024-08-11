class Admin::SessionsController < ApplicationController
  layout 'admin' 
  
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
      redirect_to admin_articles_path
    else
      render json: ['Invalid Credentials'], status: 401
    end
  end

  def destroy
    self.logout!
    redirect_to new_admin_session_path
  end
end
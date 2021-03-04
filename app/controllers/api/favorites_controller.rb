class Api::FavoritesController < ApplicationController
  before_action :require_login

  def create
    favorite = Favorite.new(
      user_id: current_user.id, 
      article_id: params[:article_id]
    )

    if favorite.save!
      render json: favorite.article_id
    else
      render json: favorite.errors.full_messages, status: 422
    end
  end

  def destroy
    favorite = Favorite.find_by(
      user_id: current_user.id,
      article_id: params[:article_id]
    )

    if favorite.destroy
      render json: favorite.id
    else
      render json: favorite.errors.full_messages, status: 422
    end
  end
end
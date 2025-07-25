# frozen_string_literal: true

module Api
  class FavoritesController < ApplicationController
    before_action :require_login

    def create
      favorite = Favorite.new(
        user_id: current_user.id,
        article_id: article_id,
      )

      if favorite.save
        render json: { articleId: favorite.article_id, favoriteId: favorite.id }
      else
        render json: favorite.errors.full_messages, status: 422
      end
    end

    def destroy
      favorite = Favorite.find_by(id: params[:id])

      if favorite.nil?
        render json: { error: "not found", status: 404 }
      elsif favorite.destroy
        render json: { articleId: favorite.article_id, favoriteId: nil }
      else
        render json: favorite.errors.full_messages, status: 422
      end
    end

    private

    def article_id
      params[:article_id]
    end
  end
end

# frozen_string_literal: true

module Api
  class ArticlesController < ApplicationController
    before_action :require_login_for_favorites, only: [:index]

    def index
      if params[:filter].nil?
        render json: { error: t(".errors.filter_missing") }, status: 400
      else
        @filter, @articles = ArticleQuery.by_filter(**filter_query_params)

        render :index
      end
    end

    def front_page
      # Added for more specific control of front page
      @highlighted_articles = Article.highlighted_articles
      @featured_article = Article.featured_article

      render :front_page
    end

    def author_articles
      if params[:before].present?
        @author_id = params[:id]
        @articles = Article.from_author(@author_id, params[:before])

        render :author_articles
      else
        render json: { error: t(".errors.before_missing") }, status: 400
      end
    end

    def show
      @article = Article.where(id: params[:id]).eager_load(:author, :photo).first

      if @article.present?
        render :show
      else
        render json: { message: t(".errors.not_found") }, status: 404
      end
    end

    private

    def filter_query_params
      {
        filter: params[:filter],
        before_id: params[:before],
        current_user: params[:filter] == "favorites" ? current_user : nil,
      }
    end

    def require_login_for_favorites
      if params[:filter] == "favorites" && !logged_in?
        render json: { error: t(".errors.user_not_logged_in") }, status: 401
      end
    end
  end
end

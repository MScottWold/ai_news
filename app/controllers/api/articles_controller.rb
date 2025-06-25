# frozen_string_literal: true

module Api
  class ArticlesController < ApplicationController
    before_action :require_login_for_favorites, only: [:index]

    def index
      @filter, @articles = ArticleQuery.by_filter(
        params[:collection],
        params[:after],
        current_user,
      )

      render :index
    end

    def front_page
      # Added for more specific control of front page
      @highlighted_articles = ArticleQuery.highlighted
      @featured_article = ArticleQuery.featured

      render :front_page
    end

    def author_articles
      # TODO: This param should be "before"
      if params[:after].present?
        @author_id = params[:id]
        @articles = ArticleQuery.by_author(@author_id, params[:after])

        render :author_articles
      else
        render json: { error: "not found" }, status: 404
      end
    end

    def show
      @article = Article.where(id: params[:id]).eager_load(:author, :photo).first

      if @article.present?
        render :show
      else
        render json: { message: "not found" }, status: 404
      end
    end

    private

    def require_login_for_favorites
      if params[:collection] == "favorites" && !logged_in?
        render json: { error: "must be logged in" }, status: 400
      end
    end
  end
end

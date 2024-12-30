module Api
  class ArticlesController < ApplicationController
    before_action :protect_favorites, only: [:index]
    before_action :require_login, only: [:favorite, :unfavorite]

    def index
      @filter, @articles = Article::CollectionFinder.
        filter_and_articles(params[:collection], params[:after], current_user)

      render :index
    end

    def front_page
      # Added for more specific control of front page
      @highlighted_articles = Article.highlighted_articles
      @featured_article = Article.featured_article

      render :front_page
    end

    def author_articles
      if params[:after].present?
        @author_id = params[:id]
        @articles = Article.author_articles(@author_id, params[:after])

        render :author_articles
      else
        render json: { error: "not found" }, status: 404
      end
    end

    def show
      @article = Article.where(id: params[:id]).eager_load(:author, :photo)[0]
      if logged_in?
        @favorite = Favorite.find_by(
          article_id: params[:id],
          user_id: current_user.id,
        ).present?
      end

      if @article
        render :show
      else
        render json: { message: "not found" }, status: 404
      end
    end

    def favorite
      favorite = Favorite.new(
        user_id: current_user.id,
        article_id: params[:id],
      )

      if favorite.save!
        render json: favorite.article_id
      else
        render json: favorite.errors.full_messages, status: 422
      end
    end

    def unfavorite
      favorite = Favorite.find_by(
        user_id: current_user.id,
        article_id: params[:id],
      )

      if favorite.destroy
        render json: favorite.article_id
      else
        render json: favorite.errors.full_messages, status: 422
      end
    end

    private

    def protect_favorites
      if params[:collection] == "favorites" && !logged_in?
        render json: { error: "must be logged in" }, status: 400
      end
    end
  end
end

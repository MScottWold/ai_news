class Api::ArticlesController < ApplicationController
  def index
    if @filter = params[:filter]
      if @filter == "latest"
        @articles = Article.get_latest(params[:after])
      elsif @filter == "featured"
        @articles = Article.get_featured_article
      elsif @filter == "trending"
        @articles = Article.order(created_at: :asc).limit(5).eager_load(:photo)
      elsif %w(us sports politics business).include?(@filter)
        @articles = Article.get_section(@filter, params[:after])
      elsif @filter == "favorites"
        @articles = Article.get_user_favorites(current_user, params[:after])
      end
    else
      @articles = Article.order(created_at: :desc).limit(10).includes(:photo, :author)
    end

    render :index
  end

  def show
    @article = logged_in? ? 
      Article.with_user_favorite(current_user.id, params[:id]) : 
      Article.find_by(id: params[:id])

    # @article = Article.find_by(id: params[:id])

    if @article
      render :show
    else
      render json: {message: 'not found'}, status: 404
    end
  end

  def favorite
    favorite = Favorite.new(
      user_id: current_user.id, 
      article_id: params[:id]
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
      article_id: params[:id]
    )

    if favorite.destroy
      render json: favorite.article_id
    else
      render json: favorite.errors.full_messages, status: 422
    end
  end
end
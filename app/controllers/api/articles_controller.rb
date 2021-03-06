class Api::ArticlesController < ApplicationController
  before_action :protect_favorites, only: [:index]
  before_action :simulate_loading

  def index
    if collection = params[:collection]
      if collection == "archives"
        @articles = Article.get_latest(params[:after])
        @filter = "collection"
      elsif collection == "featured"
        @articles = Article.get_featured_article
        @filter = "featured"
      elsif collection == "trending"
        @articles = Article.order(created_at: :asc).limit(5).eager_load(:photo)
        @filter = "trending"
      elsif %w(us sports politics business).include?(collection)
        @articles = Article.get_section(collection, params[:after])
        @filter = "collection"
      elsif collection == "favorites"
        @articles = Article.get_user_favorites(current_user, params[:after])
        @filter = "collection"
      end
    else
      @filter = 'latest'
      @articles = Article.get_latest(params[:after])
    end

    render :index
  end

  def author_articles
    if last_id = params[:after]
      @author_id = params[:id]
      @articles = Article
        .where(author_id: @author_id)
        .where("articles.id < ?", last_id)
        .order("articles.id DESC")
        .limit(5)
        .eager_load(:photo)
        
      render :author_articles
    else
      render json: {error: 'not found'}, status: 404
    end

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

  private

  def protect_favorites
    if params[:collection] == 'favorites' && !logged_in?
      render json: { error: 'must be logged in' }, status: 400 
    end
  end

  def simulate_loading
    sleep(0.5)
  end
end
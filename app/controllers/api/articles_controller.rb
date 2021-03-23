class Api::ArticlesController < ApplicationController
  before_action :protect_favorites, only: [:index]
  before_action :simulate_loading

  def index
    case params[:collection]
    when "archives"
      @articles = Article.get_latest(params[:after])
      @filter = "collection"
    when "latest"
      @filter = 'latest'
      @articles = Article.get_latest
    when "trending"
      @articles = Article.get_trending_articles
      @filter = "trending"
    when "us", "sports", "politics", "business"
      @articles = Article.get_section(params[:collection], params[:after])
      @filter = "collection"
    when "favorites"
      @articles = Article.get_user_favorites(current_user, params[:after])
      @filter = "collection"
    else
      @filter = 'none'
      @articles = Article.limit(5).includes(photo: :thumbnail_blob)
    end

    render :index
  end

  def front_page
    # Added for more specific control of front page
    @highlighted_articles = Article
      .where(highlighted: true)
      .limit(10)
      .eager_load(:author)

    @featured_article = Article
      .where(featured: true)
      .order(id: :desc)
      .limit(1)
      .eager_load(:author)
      .first

    render :front_page
  end

  def author_articles
    if last_id = params[:after]
      @author_id = params[:id]
      @articles = Article
        .where(author_id: @author_id)
        .where("articles.id < ?", last_id)
        .order("articles.id DESC")
        .limit(5)
        .includes(photo: :thumbnail_blob)
        
      render :author_articles
    else
      render json: {error: 'not found'}, status: 404
    end

  end

  def show
    @article = Article.where(id: params[:id]).eager_load(:author, :photo)[0]
    if logged_in? 
      @favorite = Favorite.find_by(
        article_id: params[:id], 
        user_id: current_user.id
      )
    end
    
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
end
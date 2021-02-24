class Api::ArticlesController < ApplicationController
  def index
    if filter = params[:filter]
      if filter == "latest"
        @articles = Article.order(created_at: :desc).limit(10).includes(:photo, :author)
        @filter_name = "latestArticleIds"
      elsif filter == "featured"
        @articles = [Article.last]
        @filter_name = "featuredArticleId"
      elsif filter == "trending"
        @articles = Article.order(created_at: :asc).limit(5).includes(:photo, :author)
        @filter_name = "trendingArticleIds"
      elsif filter == "section"
        section = params[:name]
        @articles = Article.where(section: section).order(created_at: :desc).includes(:photo, :author)
        @filter_name = "#{section}ArticleIds"
      end
    else
      @articles = Article.order(created_at: :desc).limit(10).includes(:photo, :author)
      @filter_name = :none
    end

    render :index
  end

  def show
    @article = Article.find_by(id: params[:id])

    if @article
      render :show
    else
      render json: {message: 'not found'}, status: 404
    end
  end
end
class Api::ArticlesController < ApplicationController
  def index
    if @filter = params[:filter]
      if @filter == "latest"
        @articles = Article.get_latest(params[:after])
      elsif @filter == "featured"
        @articles = [Article.last]
        # insert after featured column added
        # @articles = Article.where(featured: true).eager_load(:author, :photo)
      elsif @filter == "trending"
        @articles = Article.order(created_at: :asc).limit(5).eager_load(:photo)
      elsif %w(us sports politics business).include?(@filter)
        @articles = Article.get_section(@filter, params[:after])
      end
    else
      @articles = Article.order(created_at: :desc).limit(10).includes(:photo, :author)
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
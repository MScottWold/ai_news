class Admin::ArticlesController < ApplicationController
  layout 'admin' 
  before_action :validate_admin_login

  def index
    @articles = Article.order(section: :asc, id: :desc)

    render :index
  end

  def new
    @photos = Photo.select(:id, :title)
    @authors = Author.select(:id, :name, :education)
    @article = Article.new

    render :new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_article_url(@article)
    else
      render json: @article.errors.full_messages
    end
  end

  def show
    @article = Article.find_by(id: params[:id])

    render :show
  end

  def edit
    @article = Article.find_by(id: params[:id])
    @authors = Author.select(:id, :name, :education)
    @photos = Photo.select(:id, :title)
    if @article
      render :edit
    else
      redirect_to new_admin_article_path
    end
  end

  def update
    @article = Article.find_by(id: self.params[:id])

    if @article.update(article_params)
      redirect_to admin_article_path(@article)
    else
      render json: @article.errors.full_messages
    end
  end

  def destroy
    @article = Article.find_by(id: self.params[:id])
    @article.try(:destroy)
    redirect_to admin_articles_path
  end

  private

  def article_params
    self.params
      .require(:article)
      .permit(
        :title, 
        :body, 
        :section, 
        :author_id, 
        :photo_id, 
        :featured, 
        :highlighted
      )
  end
end
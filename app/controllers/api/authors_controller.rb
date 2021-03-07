class Api::AuthorsController < ApplicationController
  def show
    @author = Author.find_by(id: params[:id])
    @articles = @author.articles
      .limit(5)
      .order('articles.id DESC')
      .eager_load(:photo)

    if @author
      render :show
    else
      render json: {error: "author not found"}, status: 404
    end
  end
end
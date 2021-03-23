class Api::AuthorsController < ApplicationController
  def show
    @author = Author.find_by(id: params[:id])
    if @author
      @articles = @author.articles
        .limit(5)
        .order('articles.id DESC')
        .includes(photo: :thumbnail_blob)
    end

    if @author
      render :show
    else
      render json: {error: "author not found"}, status: 404
    end
  end
end
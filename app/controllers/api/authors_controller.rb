module Api
  class AuthorsController < ApplicationController
    def show
      @author = Author.find_by(id: params[:id])
      if @author
        @articles = @author.
          articles.
          includes(photo: :thumbnail_blob).
          order("articles.id DESC").
          limit(5)
      end

      if @author
        render :show
      else
        render json: { error: "author not found" }, status: 404
      end
    end
  end
end

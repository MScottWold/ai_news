class Api::AuthorsController < ApplicationController
  def show
    @author = Author.find_by(id: params[:id])

    if @author
      render :show
    else
      render json: {error: "author not found"}, status: 404
    end
  end
end
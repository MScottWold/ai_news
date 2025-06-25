# frozen_string_literal: true

module Api
  class AuthorsController < ApplicationController
    def show
      @author = Author.find_by(id: author_id)

      if @author.present?
        @articles = ArticleQuery.by_author(author_id)

        render :show
      else
        render json: { error: "author not found" }, status: 404
      end
    end

    private

    def author_id
      params[:id]
    end
  end
end

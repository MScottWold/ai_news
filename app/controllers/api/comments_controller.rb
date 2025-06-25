module Api
  class CommentsController < ApplicationController
    before_action :require_login, only: [:create]

    def index
      @comments = CommentQuery.for_article(
        article_id: article_id,
        after_id: after_id,
        before_id: before_id,
      )
    end

    def create
      @comment = current_user.comments.new(
        body: comment_body,
        article_id: article_id,
      )

      if @comment.save
        render :show
      else
        render json: @comment.errors.full_messages, status: 422
      end
    end

    private

    def after_id
      params[:after]
    end

    def before_id
      params[:before]
    end

    def comment_body
      params[:body]
    end

    def article_id
      params[:article_id]
    end
  end
end

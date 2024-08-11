module Api
  class CommentsController < ApplicationController
    before_action :require_login, only: [:create]

    def index
      @comments = Comment.where(article_id: params[:article_id])
      if latest_id = params[:after]
        @comments = @comments.where("comments.id > ?", latest_id)
      elsif earliest_id = params[:before]
        @comments = @comments.where("comments.id < ?", earliest_id)
      end
      @comments = @comments.
        order(created_at: :desc).
        limit(10).
        eager_load(:user)
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

    def comment_body
      params[:body]
    end

    def article_id
      params[:article_id]
    end
  end
end

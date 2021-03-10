class Api::CommentsController < ApplicationController
  before_action :require_login, only: [:create]
  before_action :simulate_loading

  def index
    @comments = Comment.where(article_id: params[:article_id])
    if latest_id = params[:after]
      @comments = @comments.where("comments.id > ?", latest_id)
    elsif earliest_id = params[:before]
      @comments = @comments.where("comments.id < ?", earliest_id)
    end
    @comments = @comments
      .order(created_at: :desc)
      .limit(10)
      .eager_load(:user)
  end

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      render :show
    else
      render json: @comment.errors.full_messages, status: 422
    end
  end

  private
  
  def comment_params
    self.params.require(:comment).permit(:body, :article_id)
  end
end
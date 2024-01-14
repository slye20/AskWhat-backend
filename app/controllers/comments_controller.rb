# CommentsController manages actions related to comments on forum threads.
#
# Actions:
# - index: List all comments
# - create: Create a new comment on a forum thread
# - update: Update an existing comment
# - destroy: Delete a comment
class CommentsController < ApplicationController
  skip_before_action :authorized, only: [:index]
  def index
    comments = Comment.all
    render json: comments
  end

  def create
    @comment = Comment.new(content: comment_params[:content], forum_thread_id: comment_params[:id],
                           user_id: current_user.id)
    if @comment.valid?
      @comment.save
      render json: { thread: @comment }, status: :created
    else
      render json: { error: @comment.errors.full_messages }, status: :not_acceptable
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(content: comment_params[:content])
      render json: { thread: @comment }, status: :ok
    else
      render json: { error: @comment.errors.full_messages }, status: :not_acceptable
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.delete
      render status: :ok
    else
      render json: { error: @comment.errors.full_messages }, status: :not_acceptable
    end
  end

  private

  # Define the permitted parameters for comments.
  def comment_params
    params.require(:comment).permit(:content, :id, :author, :created_at)
  end
end

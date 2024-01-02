class CommentsController < ApplicationController
	skip_before_action :authorized, only: [:index]
	def index
			comments = Comment.all
			render json: comments
	end

	def create
		@comment = Comment.new(content: comment_params[:content], forum_thread_id: comment_params[:id], user_id: current_user.id) 
		if @comment.valid?
			@comment.save
			render json: { thread: @comment, }, status: :created
		else 
			render json: { error: @comment.errors.full_messages }, status: :not_acceptable
	end
end
	private

	def comment_params
			params.require(:comment).permit(:content, :id)
	end

end

# This controller manages forum threads within the application.
# It includes actions for listing all threads, creating new threads,
# and managing thread-related activities. The controller handles
# both the rendering of thread information in JSON format and
# the acceptance of new data to create threads and associated posts.
#
# Actions:
# - index: List all forum threads, potentially with pagination.
# - create: Create a new forum thread and its first post, associating it with the current user.
class ForumThreadsController < ApplicationController
  skip_before_action :authorized, only: [:index]
  # need pagination
  def index
    forum_threads = ForumThread.all.order(created_at: :asc)
    render json: forum_threads, each_serializer: ForumThreadsSerializer
  end

  def create
    ActiveRecord::Base.transaction do
      @thread = ForumThread.new(title: thread_params[:title], user_id: current_user.id)
      thread_params[:categories].map do |category_name|
        category = Category.find_by(name: category_name)
        @thread.category << category
      end
      if @thread.save
        @post = @thread.posts.create(content: thread_params[:content], user_id: current_user.id)
        render json: { thread: @thread, post: @post }, status: :created

      else
        render json: { error: @thread.errors.full_messages }, status: :not_acceptable
      end
    end
  end

  private

  def thread_params
    params.require(:thread).permit(:title, :content, categories: [])
  end

end

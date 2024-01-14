# This controller manages forum threads within the application.
#
# Actions:
# - index: List all forum threads
# - show: Display details of a specific forum thread
# - create: Create a new forum thread
# - update: Update an existing forum thread
# - destroy: Delete a forum thread
class ForumThreadsController < ApplicationController
  skip_before_action :authorized, only: %i[index show]
  before_action :ensure_categories_present, only: %i[create update]

  def index
    threads = ForumThread.all.order(created_at: :asc)
    render json: threads, each_serializer: ForumThreadsSerializer
  end

  def show
    @thread = ForumThread.find(params[:id])
    render json: @thread, serializer: IndividualForumSerializer
  end

  def create
    @thread = ForumThread.new(title: thread_params[:title], user_id: current_user.id, content: thread_params[:content])
    update_categories
    if @thread.valid?
      @thread.save
      render json: { thread: @thread }, status: :created
    else
      render json: { error: @thread.errors.full_messages }, status: :not_acceptable
    end
  end

  def update
    @thread = ForumThread.find(params[:id])
    @thread.category.clear
    update_categories
    if @thread.update(title: thread_params[:title], content: thread_params[:content])
      render json: { thread: @thread }, status: :ok
    else
      render json: { error: @thread.errors.full_messages }, status: :not_acceptable
    end
  end

  def destroy
    @thread = ForumThread.find(params[:id])
    if @thread.destroy
      render status: :ok
    else
      render json: { error: @thread.errors.full_messages }, status: :not_acceptable
    end
  end

  private

  # Define the permitted parameters for forum threads.
  def thread_params
    params.require(:thread).permit(:title, :content, categories: [])
  end

  # Ensure that categories is not empty
  def ensure_categories_present
    return unless thread_params[:categories].blank?

    render json: { error: ['Please select a category'] }, status: :unprocessable_entity
    nil
  end

  # Update the categories associated with a forum thread.
  def update_categories
    thread_params[:categories].map do |category_name|
      category = Category.find_by(name: category_name)
      @thread.category << category
    end
  end
end

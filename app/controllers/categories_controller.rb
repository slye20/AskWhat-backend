# This controller manages category-related actions within the application.
# It includes actions for listing all categories, and related threads
#
# Actions:
# - index: List all categories
# - show: Category and a list of related threads
class CategoriesController < ApplicationController
  skip_before_action :authorized, only: %i[index show]
  def index
    categories = Category.all
    render json: categories, each_serializer: CategorySerializer
  end

  def show
    category = Category.find(params[:id])
    threads = category.forum_threads
    render json: {
      category: CategorySerializer.new(category).as_json,
      threads: threads.map { |thread| ForumThreadsSerializer.new(thread).as_json }
    }
  end
end

class CategoriesController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    def index
        categories = Category.all
        render json: categories, each_serializer: CategorySerializer
    end

    def show
        @category = Category.find(params[:id])
        threads = @category.forum_threads
        render json: {
            category: CategorySerializer.new(@category).as_json,
            threads: ActiveModel::Serializer::CollectionSerializer.new(threads, serializer: ForumThreadsSerializer).as_json
        }

    end
end

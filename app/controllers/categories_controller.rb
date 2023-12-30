class CategoriesController < ApplicationController
    skip_before_action :authorized, only: [:index]
    def index
        categories = Category.all
        render json: categories, each_serializer: CategoriesSerializer
    end
end

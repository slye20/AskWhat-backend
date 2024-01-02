class CategoriesController < ApplicationController
    skip_before_action :authorized, only: [:index]
    def index
        categories = Category.all.map(&:name)
        render json: categories
    end
end

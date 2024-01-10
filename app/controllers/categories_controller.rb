class CategoriesController < ApplicationController
    skip_before_action :authorized, only: [:index]
    def index
        categories = Category.all.map(&:name)
        render json: categories
    end

    def show
        @category = Category.find(params[:name])
        render json: @category, status: :acceptance
    end
end

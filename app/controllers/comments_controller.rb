class CommentsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    def index
        comments = Comment.all
        render json: comments
    end
    
end

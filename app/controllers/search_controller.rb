class SearchController < ApplicationController
    skip_before_action :authorized, only: [:show]

    def show
        @threads = ForumThread.where('title ILIKE ? OR content ILIKE ?', "%#{params[:q]}%", "%#{params[:q]}%").order(created_at: :desc)
        render json: @threads, each_serializer: ForumThreadsSerializer
    end
end

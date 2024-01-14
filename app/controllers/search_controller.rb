# SearchController handles actions related to searching for forum threads.
#
# Actions:
# - show: Perform a search based on a query and return matching forum threads
class SearchController < ApplicationController
  skip_before_action :authorized, only: [:show]

  def show
    @threads = ForumThread.where('title ILIKE ? OR content ILIKE ?', "%#{params[:q]}%",
                                 "%#{params[:q]}%").order(created_at: :desc)
    render json: @threads, each_serializer: ForumThreadsSerializer
  end
end

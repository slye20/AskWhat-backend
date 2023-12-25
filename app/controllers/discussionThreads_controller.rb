class DiscussionThreadsController < ApplicationController
    def index
        discussion_threads = DiscussionThread.all
        render json: discussion_threads
    end

end

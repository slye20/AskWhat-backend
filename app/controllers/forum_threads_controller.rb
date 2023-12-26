class ForumThreadsController < ApplicationController
    def index
        forum_threads = ForumThread.all
        render json: forum_threads
    end

end

class ForumThreadsController < ApplicationController
    def index # need to add different page number
        forum_threads = ForumThread.all.order(created_at: :asc)
        render json: forum_threads, each_serializer: ForumThreadsSerializer
    end

end

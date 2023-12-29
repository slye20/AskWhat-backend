class PostsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]
    def index
        posts = Post.all
        render json: posts
    end
    
    def show
        thread = ForumThread.find(params[:id])
        serialized_posts = ActiveModel::SerializableResource.new(thread.posts, each_serializer: PostsSerializer).as_json

        render json: {
        title: thread.title,
        posts: serialized_posts
        }

    end
end

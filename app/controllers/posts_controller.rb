class PostsController < ApplicationController
    def index
        posts = Post.all.order("created_at DESC")

        # have to be called like this for serialize to work
        render json: posts
    end

    def show
        post = Post.find(params[:id])
        if post
            render json: post
        end
    end

    def destroy

        post = Post.find(params[:id])
        post.destroy
        render json: {status: 'SUCCESS', message:'Deleted article', data: post.id},status: :ok
    end
end

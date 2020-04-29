class PostsController < ApplicationController
    def index
        posts = Post.all.order("created_at DESC")

        # have to be called like this for serialize to work
        render json: posts
    end

    def create
        content = params[:content]
        user_id = params[:user_id]

        post = Post.new(content: content, user_id: user_id, number_of_likes: 0)
        if post.save
            render json: post
        else
            render json: {status: 'ERROR', message:'post not saved', data:post.errors},status: :unprocessable_entity
        end
    end

    def show
        post = Post.find(params[:id])
        if post
            render json: post
        end
    end

    def destroy
        # byebug
        post = Post.find(params[:id])
        post.destroy
        render json: {status: 'SUCCESS', message:'Deleted article', data: post.id},status: :ok
    end
end

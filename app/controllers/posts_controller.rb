# The PostsController handles the CRUD operations for posts in the backend gaming social media application.

class PostsController < ApplicationController
    # GET /posts
    # Returns all posts in descending order of creation.
    def index
        posts = Post.all.order("created_at DESC")

        render json: posts
    end

    # POST /posts
    # Creates a new post with the given content and user_id.
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

    # GET /posts/:id
    # Returns the post with the specified id.
    def show
        post = Post.find(params[:id])
        if post
            render json: post
        end
    end

    # DELETE /posts/:id
    # Deletes the post with the specified id.
    def destroy
        post = Post.find(params[:id])
        post.destroy
        render json: {status: 'SUCCESS', message:'Deleted article', data: post.id},status: :ok
    end
end

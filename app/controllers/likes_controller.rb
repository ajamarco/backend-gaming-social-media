# The LikesController handles the creation and deletion of likes for posts.

class LikesController < ApplicationController
    # Creates a new like for a post.
    def create
        post_id = params[:postId]
        user_id = params[:userId]
        like = Like.new(post_id: post_id, user_id: user_id)
        if like.save
            render json: {
                status: 'SUCCESS',
                data: like
            },status: :ok
        else
            render json: {status: 'ERROR', message:'Like not saved', data:like.errors},status: :unprocessable_entity
        end
    end

    # Deletes a like for a post.
    def destroy
        post_id = params[:postId]
        user_id = params[:userId]
        like = Like.find_by(user_id: user_id, post_id: post_id)
        like.destroy
        render json: {status: 'SUCCESS', message:'Deleted like', data: like},status: :ok
    end

    private

    # Defines the permitted parameters for creating a like.
    def like_params
        params.require(:like).permit(:userId, :postId)
    end
    
end

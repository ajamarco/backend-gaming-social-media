# The CommentsController handles the creation and retrieval of comments for posts.

class CommentsController < ApplicationController
    # Creates a new comment for a post.
    #
    # Params:
    # - content: The content of the comment.
    # - user_id: The ID of the user who made the comment.
    # - post_id: The ID of the post the comment belongs to.
    #
    # Returns:
    # - If the comment is successfully saved, returns the created comment as JSON.
    # - If there is an error saving the comment, returns an error message and the validation errors as JSON.
    def create
        content = params[:content]
        user_id = params[:user_id]
        post_id = params[:post_id]
        comment = Comment.new(content: content, user_id: user_id, post_id: post_id )
        if comment.save
            render json: comment
        else
            render json: {status: 'ERROR', message:'comment not saved', data:comment.errors},status: :unprocessable_entity
        end
    end

    # Retrieves all comments.
    #
    # Returns:
    # - All comments as JSON.
    def index
        comments = Comment.all
        render json: comments
    end
end

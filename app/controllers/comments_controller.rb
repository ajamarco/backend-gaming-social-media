class CommentsController < ApplicationController
    def create
        content = params[:content]
        user_id = params[:user_id]
        post_id = params[:post_id]
        # byebug
        comment = Comment.new(content: content, user_id: user_id, post_id: post_id )
        if comment.save
            render json: comment
        else
            render json: {status: 'ERROR', message:'comment not saved', data:comment.errors},status: :unprocessable_entity
        end
    end

    def index
        comments = Comment.all
        render json: comments
    end
end

class UsersController < ApplicationController
    def sign_in
        user = User.find_by(email: params[:email])
        
        if user && user.authenticate(params[:password])
            render json: {message: "success", email: user.email, token: generate_token(id: user.id) }
        else
            render json: {message: "failure"}
        end
    end

    def validate
        id = decode_token["id"]
        user = User.find_by(id: id)
       
        if user
            render json: {message: "success", email: user.email, token: generate_token(id: user.id) }
        else
            render json: {message: "failure"}
        end
    end

    
end

class UsersController < ApplicationController
    def sign_in
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            render json: {message: "success"}
        else
            render json: {message: "failure"}
        end
    end
end

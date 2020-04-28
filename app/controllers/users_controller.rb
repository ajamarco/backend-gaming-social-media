class UsersController < ApplicationController
    def sign_in(user = "")
        #if user is login in, which means the params are in the request
        if (user == "")
            user = User.find_by(email: params[:email])
            if user && user.authenticate(params[:password])
                generate_json(user)
            else
                render json: {message: "failure"}
            end
        #if a user just sign up and will authenticate it
        else
            if user && user.authenticate(user.password)
                generate_json(user)
            else
                render json: {message: "failure"}        
            end
        #     #TODO validation and error messages if the information was wrong. Treat errors here and in the frontend. It should use the helper text. 5:43:30
        end
    end

    def create
        user = User.new(user_params)
        #TODO verify if password matches // email is unique, error handling
        if user.save
            sign_in(user)
        else
            render json: {status: 500, message: user.errors}
        end
    end


    def validate
        id = decode_token["id"]
        user = User.find_by(id: id)
       
        if user
            generate_json(user)
        else
            render json: {message: "failure"}
        end
    end

    def index
        users = User.all
        render json: users
    end

    def update
        user = User.find(params[:id])
        if user.update_attributes(user_params)
          generate_json(user)
        else
          render json: {status: 'ERROR', message:'Article not updated', data:article.errors},status: :unprocessable_entity
        end
    end

    def generate_json(user)
        render json: {
            message: "success", 
            id: user.id, 
            email: user.email,
            website: user.website,
            bio: user.bio,
            location: user.location,
            created_at: user.created_at,
            likes: user.get_users_likes,
            token: generate_token(id: user.id) }
    end

    


    private

    def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :bio, :website, :location)
    end

    
end

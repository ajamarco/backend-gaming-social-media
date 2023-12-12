# The UsersController class is responsible for handling user-related actions and requests.
class UsersController < ApplicationController
    # Signs in a user by authenticating their credentials.
    # If the user is logging in, the email and password are retrieved from the request parameters.
    # If the user is signing up, the user object is passed as an argument.
    # Returns a JSON response with the user's information and a token if successful, or a failure message if unsuccessful.
    def sign_in(user = "")
        if (user == "")
            user = User.find_by(email: params[:email])
            if user && user.authenticate(params[:password])
                generate_json(user)
            else
                render json: {message: "failure"}
            end
        else
            if user && user.authenticate(user.password)
                generate_json(user)
            else
                render json: {message: "failure"}        
            end
        end
    end

    # Retrieves and renders the information of a specific user.
    def show
        user = User.find(params[:id])
        if user
            render json: user
        end
    end

    # Creates a new user with the provided parameters.
    # Sets a default image URL if not provided.
    # Returns a JSON response with the user's information and a token if successful, or an error message if unsuccessful.
    def create
        user = User.new(user_params)
        user.img_url = 'https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png'
        if user.save
            sign_in(user)
        else
            render json: {status: 500, message: user.errors}
        end
    end

    # Validates a user's token by decoding it and finding the corresponding user.
    # Returns a JSON response with the user's information and a token if successful, or a failure message if unsuccessful.
    def validate
        id = decode_token["id"]
        user = User.find_by(id: id)
       
        if user
            generate_json(user)
        else
            render json: {message: "failure"}
        end
    end

    # Retrieves and renders the information of all users.
    def index
        users = User.all
        render json: users
    end

    # Updates the information of a specific user with the provided parameters.
    # Returns a JSON response with the updated user's information and a token if successful, or an error message if unsuccessful.
    def update
        user = User.find(params[:id])
        if user.update_attributes(user_params)
          generate_json(user)
        else
          render json: {status: 'ERROR', message:'Article not updated', data:article.errors},status: :unprocessable_entity
        end
    end

    private

    # Defines the permitted parameters for creating or updating a user.
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :bio, :website, :location, :img_url)
    end

    # Generates a JSON response with the user's information and a token.
    def generate_json(user)
        render json: {
            message: "success", 
            id: user.id, 
            email: user.email,
            website: user.website,
            bio: user.bio,
            img_url: user.img_url,
            location: user.location,
            created_at: user.created_at,
            likes: user.get_users_likes,
            token: generate_token(id: user.id) }
    end
end

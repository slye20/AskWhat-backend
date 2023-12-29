class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

    def create
        username = user_login_params[:username]
        password = user_login_params[:password]
        
        # Check if username or password is empty
        error = []
        if username.blank?
            error = error + ["Username can't be blank."]
        end
        if password.blank?
            error = error + ["Password can't be blank."]
        end
        if error.any?
            render json: { error: error }, status: :unprocessable_entity
            return
        end

        user = User.find_by(username: username)
        if user && user.authenticate(password)
            @token = encode_token({user_id: user.id})
            render json: { user: user, jwt: @token }, status: :accepted
        else
            render json: { error: "Invalid username or password"}, status: :unauthorized
        end
    end

    private 

    def user_login_params
     params.require(:user).permit(:username, :password)
   end

    def handle_record_not_found(e)
        render json: { message: "User doesn't exist" }, status: :unauthorized
    end
end

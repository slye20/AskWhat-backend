class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

    def create
       user = User.find_by(username: user_login_params[:username])
       if user && user.authenticate(user_login_params[:password])
            @token = encode_token({user_id: user.id})
            render json: { user: user, jwt: @token }, status: :accepted
        else
            render json: {message: 'Incorrect password'}, status: :unauthorized
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

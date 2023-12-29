class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid_record

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            @token = encode_token({user_id: @user.id})
            render json: { user: @user, jwt: @token }, status: :created
        else
            render json: { error:@user.errors.full_messages}, status: :not_acceptable
        end
    end

    def show 
        render json: current_user, status: :ok
    end

    private

    def user_params
         params.require(:user).permit(:username, :email, :password)
    end

    def handle_invalid_record(e)
            render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
end

# AuthController handles user authentication and token generation.
#
# Actions:
# - create: Create a new user session and generate an authentication token.
class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]
  # Handle the case where a specified record is not found
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def create
    username = user_login_params[:username]
    password = user_login_params[:password]

    # Check if username or password is empty
    error = []
    error << ["Username can't be blank."] if username.blank?
    error << ["Password can't be blank."] if password.blank?
    if error.any?
      render json: { error: }, status: :unprocessable_entity
      return
    end

    user = User.find_by(username:)
    if user&.authenticate(password)
      @token = encode_token({ user_id: user.id })
      render json: { user:, jwt: @token }, status: :accepted
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  def user_login_params
    params.require(:user).permit(:username, :password)
  end

  # Handle the case where a specified record is not found.
  def handle_record_not_found
    render json: { message: "User doesn't exist" }, status: :unauthorized
  end
end

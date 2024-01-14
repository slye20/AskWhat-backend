# ApplicationController is the base controller for the application,
# providing common functionality related to user authentication and
# authorization using JWT (JSON Web Tokens).
class ApplicationController < ActionController::API
  before_action :authorized

  # Retrieve the JWT secret key from application credentials.
  def jwt_key
    Rails.application.credentials.jwt_key
  end

  # Encode a payload (user_id) into a JWT token.
  def encode_token(payload)
    JWT.encode(payload, jwt_key, 'HS256')
  end

  # Decode a JWT token from the request header.
  def decode_token
    header = request.headers['Authorization']
    return unless header

    token = header.split(' ')[1]
    begin
      JWT.decode(token, jwt_key, true, algorithm: 'HS256')
    rescue JWT::DecodeError
    end
  end

  # Returns the current user if authenticated, or nil if not.
  def current_user
    return unless decode_token

    user_id = decode_token[0]['user_id']
    @user = User.find_by(id: user_id)
  end

  # Check if the current user is authorized.
  def authorized
    return if !!current_user

    render json: { error: 'Please log in' }, status: :unauthorized
  end
end

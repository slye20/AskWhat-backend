class ApplicationController < ActionController::API
    before_action :authorized

    def jwt_key
        Rails.application.credentials.jwt_key
    end

    def encode_token(payload) #user_id as payload
        JWT.encode(payload, jwt_key, 'HS256')
    end

    def decode_token
        header = request.headers['Authorization']
        if header
            token = header.split(" ")[1]
            puts jwt_key
            begin
                JWT.decode(token, jwt_key, true, algorithm: 'HS256')
            rescue JWT::DecodeError
            end
        end
    end

    def current_user 
        if decode_token
            user_id = decode_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end
    end

    def authorized
        unless !!current_user
        render json: { message: 'Please log in' }, status: :unauthorized
        end
    end

end

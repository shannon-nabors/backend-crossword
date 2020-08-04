class AuthController < ApplicationController

    def create
        user = User.find_by(username: params["username"])
        if user && user.authenticate(params["password"])
            payload = {user_id: user.id}
            token = encode(payload)
            render json: {
                user: user.as_json(except: :password_digest),
                token: token
            }
        else
            render json: {error: true, message: "Incorrect username or password"}
        end
    end

    def verify
        payload = decode(request.headers["Authentication"])
        user = User.find(payload["user_id"])
        render json: user.as_json(except: :password_digest)
    end

end
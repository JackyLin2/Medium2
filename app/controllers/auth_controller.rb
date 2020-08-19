class AuthController < ActionController
    def login
        user = User.find_by(username: params[:username]) # finds the user by username
        if user && user.authenticate(params[:password]) # uses authenticate method from bcrypt to compare password
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {user: user, jwt: token, success: "Welcome back, #{user.username}"}
        else
            render json: {failure: "Log in failed! Username or password invalid!"}
        end
    end

    def auto_login
        if session_user # if session_user returns anything
            render json: session_user # render it as a json object
        else # otherwise
            render json: {errors: "No User Logged In"} # return an error
        end
    end
end
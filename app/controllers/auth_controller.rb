class AuthController < ApplicationController
    def login
        user = User.find_by(username: params[:username])

        if !user
            render status: :unauthorized
        else
            if user.authenticate(params[:password])
                render json: {
                    message: "You did it!"
                }
            else
                render status: :unauthorized
            end
        end
    end
end

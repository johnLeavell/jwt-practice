class UsersController < ApplicationController

    def index
        user = Users.all

        render json: user
    end

    def create
        user = User.create(
            username: params[:username],
            password: params[:password]
        )
        render json: user, status: :created
    end

    # private 
    # def login_params
    #     params.require(:user). permit(:username, :password)
    # end
end

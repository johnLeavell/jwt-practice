class BalloonsController < ApplicationController
    def index
        balloons = Balloon.all

        render json: { balloons: balloons }
    end

    def create
        authorization_header = request.headers[:authorization]
        if !authorization_header
            render status: :unauthorized
        else
            token = authorization_header.split(" ")[1]
            secret_key = Rails.application.secrets.secret_key_base[0]
            decoded_token = JWT.decode(token, secret_key)

            # byebug
            user = User.find(decoded_token[0]["user_id"])

            balloon = Balloon.create(
                name: params[:name],
                user: user
            )

            render json: { balloon: balloon }
        end
        
    end
end

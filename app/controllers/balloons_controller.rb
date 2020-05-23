class BalloonsController < ApplicationController
    before_action :authenticate, only: [:create] 
    def index
        balloons = Balloon.all

        render json: { balloons: balloons }
    end

    def create
        balloon = Balloon.create(
            name: params[:name],
            user: @user
        )

        render json: { balloon: balloon }
    end
        
end

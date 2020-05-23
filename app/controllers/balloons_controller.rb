class BalloonsController < ApplicationController
    def index
        balloons = Balloon.all

        render json: { balloons: balloons }
    end

    def create
        balloon = Balloon.create(
            name: params[:name]
        )

        render json: { balloon: balloon }
    end
end

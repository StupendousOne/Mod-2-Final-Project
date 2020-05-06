class KitchensController < ApplicationController

    before_action :authorized
    
    def index
        @kitchens = Kitchen.all
    end

    def new
        @kitchen = Kitchen.new
    end

    def create
        @kitchen = Kitchen.create(kitchen_params)
        redirect_to kitchen_path(@kitchen)
    end

    def show
        @kitchen = Kitchen.find_by(id: params[:id])
    end

    def edit
    end

    def update
    end

    def delete
    end

    private

        def kitchen_params
            params.require(:kitchen).permit(:size, :room_style_id)
        end
end

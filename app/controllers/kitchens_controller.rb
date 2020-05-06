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
        @kitchen = Kitchen.find_by(id: params[:id])
    end

    def update
        @kitchen = Kitchen.find_by(id: params[:id])
        @kitchen.update(kitchen_params)
        redirect_to kitchen_path(@kitchen)
    end

    def destroy
        @kitchen = Kitchen.find_by(id: params[:id])
        begin
            @kitchen.destroy
        rescue => exception
            flash.alert = "Deletion Failed"
            redirect_to kitchens_path
        else
            flash.alert = "Deletion Successful"
            redirect_to kitchens_path
        end
    end

    private

        def kitchen_params
            params.require(:kitchen).permit(:size, :room_style_id)
        end
end

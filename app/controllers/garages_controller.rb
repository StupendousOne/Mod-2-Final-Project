class GaragesController < ApplicationController
    before_action :find_garage, only:[:show, :edit, :update]
    
    def index
        @garages = Garage.all
    end

    def show
    end

    def edit
    end

    def update
        if(@garage.update(garage_params))
            flash[:success] = "Garage Updated"
            redirect_to garage_path(@garage)
        else
            flash[:errors] = @garage.errors.full_messages
            redirect_to edit_garage_path(@garage)
        end
    end

    def new
        @garage = Garage.new
    end

    def create
        room = Garage.new(garage_params)
        if(room.valid?)
            room.save
            flash[:success] = "Garage No. #{room.id} created"
            redirect_to garage_path(room)
        else
            flash[:errors] = room.errors.full_messages
            redirect_to new_garage_path
        end
    end

    def destroy
        if @garage.destroy
            flash[:message] = "Garage was deleted!"
            redirect_to garages_path
        else
            flash[:message] = "Garage deletion failed!"
            redirect_to garages_path
        end
    end

    private
    def find_garage
        @garage = Garage.find_by(id: params[:id])
    end
    
    def garage_params
        params.require(:garage).permit(:size, :room_style_id, :user_id)
    end
end

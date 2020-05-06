class BedroomsController < ApplicationController
    before_action :find_bedroom, only:[:show, :edit, :update]
    
    def index
        @bedrooms = Bedroom.all
    end

    def show
    end

    def edit
    end

    def update
        if(@bedroom.update(bedroom_params))
            flash[:success] = "Bedroom Updated"
            redirect_to bedroom_path(@bedroom)
        else
            flash[:errors] = @bedroom.errors.full_messages
            redirect_to edit_bedroom_path(@bedroom)
        end
    end

    def new
        @bedroom = Bedroom.new
    end

    def create
        room = Bedroom.new(bedroom_params)
        if(room.valid?)
            room.save
            flash[:success] = "Bedroom No. #{room.id} created"
            redirect_to bedroom_path(room)
        else
            flash[:errors] = room.errors.full_messages
            redirect_to new_bedroom_path
        end
    end

    def destroy
        if @bedroom.destroy
            flash[:message] = "Bedroom was deleted!"
            redirect_to bedrooms_path
        else
            flash[:message] = "Bedroom deletion failed!"
            redirect_to bedrooms_path
        end
    end

    private
    def find_bedroom
        @bedroom = Bedroom.find_by(id: params[:id])
    end
    
    def bedroom_params
        params.require(:bedroom).permit(:size, :room_style_id, :user_id)
    end
end

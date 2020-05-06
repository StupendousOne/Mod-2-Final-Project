class OtherRoomsController < ApplicationController
    before_action :find_other_room, only:[:show, :edit, :update]
    
    def index
        @other_rooms = OtherRoom.all
    end

    def show
    end

    def edit
    end

    def update
        if(@other_room.update(other_room_params))
            flash[:success] = "OtherRoom Updated"
            redirect_to other_room_path(@other_room)
        else
            flash[:errors] = @other_room.errors.full_messages
            redirect_to edit_other_room_path(@other_room)
        end
    end

    def new
        @other_room = OtherRoom.new
    end

    def create
        room = OtherRoom.new(other_room_params)
        if(room.valid?)
            room.save
            flash[:success] = "#{room.room_type} created"
            redirect_to other_room_path(room)
        else
            flash[:errors] = room.errors.full_messages
            redirect_to new_other_room_path
        end
    end

    def destroy
        if @other_room.destroy
            flash[:message] = "Room was deleted!"
            redirect_to other_rooms_path
        else
            flash[:message] = "Room deletion failed!"
            redirect_to other_rooms_path
        end
    end

    private
    def find_other_room
        @other_room = OtherRoom.find_by(id: params[:id])
    end
    
    def other_room_params
        params.require(:other_room).permit(:size, :room_style_id, :room_type, :user_id)
    end
end

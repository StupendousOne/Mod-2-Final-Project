class RoomStylesController < ApplicationController
    before_action :find_room_style, only:[:show, :edit, :update]
    
    def index
        @room_styles = RoomStyle.all
    end

    def show
    end

    def edit
    end

    def update
        if(@room_style.update(room_style_params))
            flash[:success] = "Style Updated"
            redirect_to room_style_path(@room_style)
        else
            flash[:errors] = @room_style.errors.full_messages
            redirect_to edit_room_style_path(@room_style)
        end
    end

    def new
        @room_style = RoomStyle.new
    end

    def create
        style = RoomStyle.new(room_style_params)
        if(style.valid?)
            flash[:success] = "Style Created"
            style.save
            redirect_to room_style_path(style)
        else
            flash[:errors] = style.errors.full_messages
            redirect_to new_room_style_path
        end
    end

    def destroy
        if @room_style.destroy
            flash[:message] = "Style was deleted!"
            redirect_to room_styles_path
        else
            flash[:message] = "Style deletion failed!"
            redirect_to room_styles_path
        end
    end

    private
    def find_room_style
        @room_style = RoomStyle.find_by(id: params[:id])
    end
    
    def room_style_params
        params.require(:room_style).permit(:style, :cost, :desc, :user_id)
    end
end

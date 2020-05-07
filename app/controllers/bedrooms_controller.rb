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
        updated_params = bedroom_params
        house_ids = {current_user_houses: current_user.houses, update: updated_params[:house_ids]}
        house_ids.reject{|id| id == ""}
        updated_params[:house_ids] = @bedroom.get_all_missing_houses(house_ids)
        
        if(@bedroom.update(updated_params))
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
        @bedroom = Bedroom.new(bedroom_params)
        if(@bedroom.valid?)
            @bedroom.save
            flash[:success] = "Bedroom No. #{@bedroom.id} created"
            redirect_to bedroom_path(@bedroom)
        else
            flash[:errors] = @bedroom.errors.full_messages
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
        params.require(:bedroom).permit(:size, :room_style_id, :user_id, house_ids:[])
    end
end

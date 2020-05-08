class BathroomsController < ApplicationController

    before_action :authorized
    before_action :find_bathroom, only: [:show, :edit, :update, :destroy]
    before_action :is_current_user, only: [:show]

    def index
        @bathrooms = Bathroom.all
    end

    def new
        @bathroom = Bathroom.new
    end

    def create
        @bathroom = Bathroom.create(bathroom_params)
        redirect_to bathroom_path(@bathroom)
    end

    def show
        @current_user_boolean = is_current_user
        if @bathroom.half
            @half = "This is a half bath so there is no shower"
        else
            @half = "This is a full bath so there is a shower"
        end
    end

    def edit
        if current_user != @bathroom.user
            flash.alert = "Cannot Edit Other User's Pages"
            redirect_to bathroom_path(@bathroom)
        end
    end

    def update
        updated_params = bathroom_params
        house_ids = {current_user_houses: current_user.houses, update: updated_params[:house_ids]}
        house_ids.reject{|id| id == ""}
        updated_params[:house_ids] = @bathroom.get_all_missing_houses(house_ids)

        if(@bathroom.update(updated_params))
            flash[:success] = "Bathroom Updated"
            redirect_to bathroom_path(@bathroom)
        else
            flash[:errors] = @bathroom.errors.full_messages
            redirect_to edit_bathroom_path(@bathroom)
        end
    end

    def destroy
        if current_user == @bathroom.user
            begin
                @bathroom.destroy
            rescue => exception
                flash.alert = "Deletion Failed"
                redirect_to bathrooms_path
            else
                flash.alert = "Deletion Successful"
                redirect_to bathrooms_path
            end
        else
            flash.alert = "Deletion Failed. Not Your Bathroom."
            redirect_to bathrooms_path
        end
    end

    private

        def bathroom_params
            params.require(:bathroom).permit(:size, :half, :room_style_id, :user_id, house_ids:[])
        end

        def find_bathroom
            @bathroom = Bathroom.find_by(id: params[:id])
        end

        def is_current_user
            @bathroom.user == current_user
        end
end

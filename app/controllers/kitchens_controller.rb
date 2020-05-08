class KitchensController < ApplicationController

    before_action :authorized
    before_action :find_kitchen, only:[:show, :edit, :update, :destroy]
    before_action :is_current_user, only: [:show]
    
    def index
        @kitchens = Kitchen.all
    end

    def new
        @kitchen = Kitchen.new
    end

    def create
        @kitchen = Kitchen.create(kitchen_params)
        if @kitchen.errors.empty?
            redirect_to kitchen_path(@kitchen)
        else
            flash.alert = "Kitchen Creation Failed"
            render :new
        end
    end

    def show
        @current_user_boolean = is_current_user
    end

    def edit
        if current_user != @kitchen.user
            flash.alert = "Cannot Edit Other User's Pages"
            redirect_to kitchen_path(@kitchen)
        end
    end

    def update
        @kitchen.update(updated_params)
        redirect_to kitchen_path(@kitchen)
    end

    def destroy
        if @kitchen.user = current_user
            begin
                @kitchen.destroy
            rescue => exception
                flash.alert = "Deletion Failed. Can't Be Deleted."
                redirect_to kitchens_path
            else
                flash.alert = "Deletion Successful"
                redirect_to kitchens_path
            end
        else
            flash.alert = "Deletion Failed. Not Your Kitchen."
            redirect_to kitchens_path
        end
    end

    private

        def kitchen_params
            params.require(:kitchen).permit(:size, :room_style_id, :user_id)
        end

        def find_kitchen
            @kitchen = Kitchen.find_by(id: params[:id])
        end

        def is_current_user
            @kitchen.user == current_user
        end
end

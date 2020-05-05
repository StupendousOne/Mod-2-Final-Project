class BathroomsController < ApplicationController
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
        @bathroom = Bathroom.find_by(id: params[:id])
        if @bathroom.half
            @half = "This is a half bath so there is no shower"
        else
            @half = "This is a full bath so there is a shower"
        end
    end

    def edit
        @bathroom = Bathroom.find_by(id: params[:id])
    end

    def update
        @bathroom = Bathroom.find_by(id: params[:id])
        @bathroom.update(bathroom_params)
        redirect_to bathroom_path(@bathroom)
    end

    def destroy
        @bathroom = Bathroom.find_by(id: params[:id])
        begin
            @bathroom.destroy
        rescue => exception
            flash.alert = "Deletion Failed"
            redirect_to bathrooms_path
        else
            flash.alert = "Deletion Successful"
            redirect_to bathrooms_path
        end
    end
    
    private

        def bathroom_params
            params.require(:bathroom).permit(:size, :half, :room_style_id)
        end
end

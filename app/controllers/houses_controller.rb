class HousesController < ApplicationController
    
    before_action :authorized
    before_action :find_house, only: [:show, :edit, :update]
    
    def index
        @houses = House.all
    end

    def new
        @house = House.new
    end

    def create
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

        def find_house
            @house = House.find_by(id: params[:id])
        end
end

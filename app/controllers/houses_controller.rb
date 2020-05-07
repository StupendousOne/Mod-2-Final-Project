class HousesController < ApplicationController
    
    before_action :authorized
    
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
end

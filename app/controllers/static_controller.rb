class StaticController < ApplicationController
    def home
        render :layout => false
    end

    def analytics

    end

    def analytics_garages
        @class = Garage
    end

    def analytics_bedrooms
        @class = Bedroom
    end

    def analytics_bathrooms
        @class = Bathroom
    end

    def analytics_kitchens
        @class = Kitchen
    end

    def analytics_other_rooms
        @class = OtherRoom
    end

    def analytics_houses
        @class = House
    end
end

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

    end

    def analytics_bathrooms

    end

    def analytics_kitchens

    end

    def analytics_other_rooms

    end

    def analytics_houses

    end
end

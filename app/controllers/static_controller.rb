class StaticController < ApplicationController
    def home
        render :layout => false
    end
end

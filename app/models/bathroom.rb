class Bathroom < ApplicationRecord
    has_many :housebathrooms
    has_many :houses, through: :housebathrooms
    belongs_to :room_style
    belongs_to :user, optional: true

    def bathroom_cost
        if self.half?
            half_cost = 0.75
        else
            half_cost = 1.25
        end
    bathroom_cost = (self.size * self.room_style.cost * 10 * half_cost).round(2)
    end

    def get_all_missing_houses(houses)
        new_house_id_list = []
        
        self.houses.each {|h| new_house_id_list << h.id.to_s}
        
        #find houses that need to be disconnected
        houses_to_remove = []
        
        hhouses[:current_user_houses].each do |house|
            if(!houses[:update].include? house.id.to_s)
                houses_to_remove << house.id.to_s 
            end
        end
        
        #Add new houses to connect to
        houses[:update].each do |id|
            if(!new_house_id_list.include? id)
                #byebug
                new_house_id_list << id 
            end
        end

        #remove houses the user owns that arent going to be connected anymore
        new_house_id_list.reject {|id| houses_to_remove.include? id}
    end

end

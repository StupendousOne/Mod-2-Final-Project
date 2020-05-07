class Garage < ApplicationRecord
    has_many :housegarages
    has_many :houses, through: :housegarages
    belongs_to :room_style
    belongs_to :user, optional: true

    validates :size, :room_style_id, presence: true

    def self.analytics_header
        "Garage Analytics"
    end

    def self.avg_cost
        
    end

    def self.avg_size

    end

    def self.highest_cost

    end

    def self.largest

    end
    
    def self.lowest_cost

    end

    def self.smallest

    end

    def get_all_missing_houses(houses)
        new_house_id_list = []
        
        self.houses.each {|h| new_house_id_list << h.id.to_s}
        
        #find houses that need to be disconnected
        houses_to_remove = []
        
        houses[:current_user_houses].each do |house|
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

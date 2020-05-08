class OtherRoom < ApplicationRecord
    has_many :houseothers
    has_many :houses, through: :houseothers
    belongs_to :room_style
    belongs_to :user, optional: true

    validates :size, :room_style_id, :room_type, presence: true

    def cost
        (self.size * self.room_style.cost * 10).round(2)
    end

    def name
        "Other Room"
    end

    def self.avg_cost
        cost_arr = self.all.map {|i| i.cost}
        cost_arr.sum/cost_arr.length
    end

    def self.avg_size
        size_arr = self.all.map {|i| i.size}
        size_arr.sum/size_arr.length
    end

    def self.highest_cost
        self.all.max{|a,b| a.cost <=> b.cost}.cost
    end

    def self.largest
        self.all.max{|a,b| a.size <=> b.size}.size
    end
    
    def self.lowest_cost
        self.all.min{|a,b| a.cost <=> b.cost}.cost
    end

    def self.smallest
        self.all.min{|a,b| a.size <=> b.size}.size
    end

    def get_all_missing_houses(houses)
        new_house_id_list = []
        
        self.houses.each {|h| new_house_id_list << h.id.to_s}
        
        #find houses that need to be disconnected
        houses_to_remove = []
        
        houses[:current_user_houses].each do |id|
            if(!houses[:update].include? id)
                houses_to_remove << id 
            end
        end
        
        houses[:current_user_houses].each do |house|
            if(!houses[:update].include? house.id.to_s)
                houses_to_remove << house.id.to_s 
            end
        end

        #remove houses the user owns that arent going to be connected anymore
        new_house_id_list.reject {|id| houses_to_remove.include? id}
    end

end

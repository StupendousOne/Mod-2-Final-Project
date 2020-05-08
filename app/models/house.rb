class House < ApplicationRecord
    has_many :houseothers
    has_many :other_rooms, through: :houseothers
    has_many :housebathrooms
    has_many :bathrooms, through: :housebathrooms
    has_many :housegarages
    has_many :garages, through: :housegarages
    has_many :housekitchens
    has_many :kitchens, through: :housekitchens
    has_many :housebedrooms
    has_many :bedrooms, through: :housebedrooms
    belongs_to :user

    def house_name
        "House no. #{self.id}"
    end

    def cost
        final_cost = 0

        self.bathrooms.each{|br| final_cost += br.cost}
        self.bedrooms.each{|br| final_cost += br.cost}
        self.kitchens.each{|br| final_cost += br.cost}
        self.garages.each{|br| final_cost += br.cost}
        self.other_rooms.each{|br| final_cost += br.cost}

        final_cost
    end

    def name
        "House"
    end

    def room_count
        room_count = 0

        room_count += self.bathrooms.length
        room_count += self.bedrooms.length
        room_count += self.kitchens.length
        room_count += self.garages.length
        room_count += self.other_rooms.length

        room_count
    end

    def size
        final_size = 0

        self.bathrooms.each{|br| final_size += br.size}
        self.bedrooms.each{|br| final_size += br.size}
        self.kitchens.each{|br| final_size += br.size}
        self.garages.each{|br| final_size += br.size}
        self.other_rooms.each{|br| final_size += br.size}

        final_size
    end

    def self.avg_room_count
        count_arr = self.all.map {|i| i.room_count}
        count_arr.sum/count_arr.length
    end

    def self.avg_cost
        cost_arr = self.all.map {|i| i.cost}
        cost_arr.sum/cost_arr.length
    end

    def self.avg_size
        size_arr = self.all.map {|i| i.size}
        size_arr.sum/size_arr.length
    end

    def self.most_rooms
        self.all.max{|a,b| a.room_count <=> b.room_count}.room_count
    end

    def self.highest_cost
        self.all.max{|a,b| a.cost <=> b.cost}.cost
    end

    def self.largest
        self.all.max{|a,b| a.size <=> b.size}.size
    end

    def self.least_rooms
        self.all.max{|a,b| a.room_count <=> b.room_count}.room_count
    end
    
    def self.lowest_cost
        self.all.min{|a,b| a.cost <=> b.cost}.cost
    end

    def self.smallest
        self.all.min{|a,b| a.size <=> b.size}.size
    end
end

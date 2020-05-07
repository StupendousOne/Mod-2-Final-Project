class RoomStyle < ApplicationRecord
    has_many :bedrooms
    has_many :bathrooms
    has_many :kitchens
    has_many :garages
    has_many :other_rooms
    belongs_to :user, optional: true

    validates :style, :cost, :desc, presence: true

    def all_rooms
        rooms = []
        self.bedrooms.each{|room| rooms << room}
        self.bathrooms.each{|room| rooms << room}
        self.kitchens.each{|room| rooms << room}
        self.garages.each{|room| rooms << room}
        self.other_rooms.each{|room| rooms << room}
        rooms
    end
end

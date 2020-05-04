class RoomStyle < ApplicationRecord
    has_many :bedrooms
    has_many :bathrooms
    has_many :kitchens
    has_many :garages
    has_many :other_rooms
end

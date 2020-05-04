class House < ApplicationRecord
    has_many :houseothers
    has_many :other_rooms, through: :houseothers
    has_many :housebathrooms
    has_many :bathrooms, through: :housebathrooms
    has_many :housegarages
    has_many :garages, through: :housegarages
end

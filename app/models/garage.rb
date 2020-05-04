class Garage < ApplicationRecord
    has_many :housegarages
    has_many :houses, through: :housegarages
end

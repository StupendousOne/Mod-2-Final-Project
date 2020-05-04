class Bedroom < ApplicationRecord
    has_many :housebedrooms
    has_many :houses, through: :housebedrooms
end

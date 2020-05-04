class OtherRoom < ApplicationRecord
    has_many :houseothers
    has_many :houses, through: :houseothers
end

class Bathroom < ApplicationRecord
    has_many :housebathrooms
    has_many :houses, through: :housebathrooms
    belongs_to :room_style
end

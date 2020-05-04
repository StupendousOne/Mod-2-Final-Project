class Bathroom < ApplicationRecord
    has_many :housebathrooms
    has_many :houses, through: :housebathrooms
end

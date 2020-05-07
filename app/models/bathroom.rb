class Bathroom < ApplicationRecord
    has_many :housebathrooms
    has_many :houses, through: :housebathrooms
    belongs_to :room_style
    belongs_to :user, optional: true

    def bathroom_cost
        if self.half?
            half_cost = 0.75
        else
            half_cost = 1.25
        end
    bathroom_cost = (self.size * self.room_style.cost * 10 * half_cost).round(2)
    end
end

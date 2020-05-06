class Bedroom < ApplicationRecord
    has_many :housebedrooms
    has_many :houses, through: :housebedrooms
    belongs_to :room_style

    validates :size, :room_style_id, presence: true
end

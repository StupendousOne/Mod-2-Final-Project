class Garage < ApplicationRecord
    has_many :housegarages
    has_many :houses, through: :housegarages
    belongs_to :room_style
    belongs_to :user

    validates :size, :room_style_id, presence: true
end

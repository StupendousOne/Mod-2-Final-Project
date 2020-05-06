class OtherRoom < ApplicationRecord
    has_many :houseothers
    has_many :houses, through: :houseothers
    belongs_to :room_style
    belongs_to :user

    validates :size, :room_style_id, :room_type, presence: true
end

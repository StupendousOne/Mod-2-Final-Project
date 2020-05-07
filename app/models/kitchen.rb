class Kitchen < ApplicationRecord
    has_many :housekitchens
    has_many :houses, through: :housekitchens
    belongs_to :room_style
    belongs_to :user, optional: true

    validates :size, presence: true
end

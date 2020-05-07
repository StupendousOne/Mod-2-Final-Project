class House < ApplicationRecord
    has_many :houseothers
    has_many :other_rooms, through: :houseothers
    has_many :housebathrooms
    has_many :bathrooms, through: :housebathrooms
    has_many :housegarages
    has_many :garages, through: :housegarages
    has_many :housekitchens
    has_many :kitchens, through: :housekitchens
    has_many :housebedrooms
    has_many :bedrooms, through: :housebedrooms
    belongs_to :user, optional: true
end

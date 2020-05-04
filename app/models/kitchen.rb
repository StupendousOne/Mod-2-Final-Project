class Kitchen < ApplicationRecord
    has_many :housekitchens
    has_many :houses, through: :housekitchens
end

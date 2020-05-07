class User < ApplicationRecord
    has_secure_password
    has_many :garages
    has_many :houses
    has_many :bathrooms
    has_many :bedrooms
    has_many :kitchens
    has_many :other_rooms
    has_many :room_styles

    validates :name, :email, presence: true
    validates :password, presence: true, if: :password
    validates :name, uniqueness: true 
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end

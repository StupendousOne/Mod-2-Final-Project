class User < ApplicationRecord
    has_secure_password
    has_many :garages
    has_many :houses
    has_many :bathrooms
    has_many :bedrooms
    has_many :kitchens
    has_many :other_rooms

    validates :password, :name, :email, presence: true
    validates :name, uniqueness: true 
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end

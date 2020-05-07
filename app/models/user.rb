class User < ApplicationRecord
    has_secure_password
    has_many :garages
    has_many :houses
    has_many :bathrooms
    has_many :bedrooms
    has_many :kitchens
    has_many :other_rooms
    has_many :room_styles

    validates :email, presence: true
    validates :password, presence: true, if: :password
    validates :name, presence: true
    validates :name, uniqueness: true 
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

    # def force_destroy
    #     ghost.houses = self.houses
    #     self.houses = nil

    #     ghost.garages = self.garages
    #     self.garages = nil

    #     ghost.bathrooms = self.bathrooms
    #     self.bathrooms = nil

    #     ghost.bedrooms = self.bedrooms
    #     self.bedrooms = nil

    #     ghost.kitchens = self.kitchens
    #     self.kitchens = nil

    #     ghost.other_rooms = self.other_rooms
    #     self.other_rooms = nil

    #     ghost.room_styles = self.room_styles
    #     self.room_styles = nil

    #     ghost.save

end

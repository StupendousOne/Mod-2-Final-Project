class User < ApplicationRecord
    has_secure_password

    validates :password, :name, :email, presence: true
    validates :name, uniqueness: true 
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end

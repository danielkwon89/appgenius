class Genius < ApplicationRecord
    has_secure_password
    has_many :pitches
    validates :password, length: {in: 6..20}
    validates :first_name, :last_name, :email, presence: true
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP} 
end

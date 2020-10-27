class Angel < ApplicationRecord
    has_secure_password
    has_many :investments
    has_many :pitches, through: :investments
    validates :password, length: {in: 6..20}
    validates :first_name, :last_name, :email, presence: true
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP} 
end

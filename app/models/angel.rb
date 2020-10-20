class Angel < ApplicationRecord
    has_secure_password
    has_many :investments
    has_many :pitches, through: :investments
end

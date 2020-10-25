class Pitch < ApplicationRecord
    belongs_to :genius
    has_many :angels, through: :investments
    has_many :investments
    scope :fully_funded, -> {where "total_funding >= funding_goal"}
end

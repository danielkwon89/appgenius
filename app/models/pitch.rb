class Pitch < ApplicationRecord
    belongs_to :genius
    has_many :angels, through: :investments
end

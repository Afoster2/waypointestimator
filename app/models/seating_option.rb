class SeatingOption < ApplicationRecord
  belongs_to :boat_model
  has_many :estimate_seating_options
  has_many :estimates, through: :estimate_seating_options
end

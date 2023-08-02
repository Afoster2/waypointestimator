class TrailerUpgrade < ApplicationRecord
  belongs_to :boat_model
  has_many :estimate_trailer_upgrades
  has_many :estimates, through: :estimate_trailer_upgrades
end

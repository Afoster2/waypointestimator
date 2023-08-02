class WetsoundPackage < ApplicationRecord
  belongs_to :boat_model
  has_many :estimate_wetsound_packages
  has_many :estimates, through: :estimate_wetsound_packages
end

class LightingOption < ApplicationRecord
  belongs_to :boat_model
  has_many :estimate_lighting_options
  has_many :estimates, through: :estimate_lighting_options
end

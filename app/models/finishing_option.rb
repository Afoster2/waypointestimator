class FinishingOption < ApplicationRecord
  belongs_to :boat_model
  has_many :estimate_finishing_options
  has_many :estimates, through: :estimate_finishing_options
end

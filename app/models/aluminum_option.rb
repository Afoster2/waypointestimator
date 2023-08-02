class AluminumOption < ApplicationRecord
  belongs_to :boat_model
  has_many :estimate_aluminum_options
  has_many :estimates, through: :estimate_aluminum_options
end

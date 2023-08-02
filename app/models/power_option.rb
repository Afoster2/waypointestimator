class PowerOption < ApplicationRecord
  belongs_to :boat_model
  has_many :estimate_power_options
  has_many :estimates, through: :estimate_power_options
end

class GaugeUpgrade < ApplicationRecord
  belongs_to :boat_model
  has_many :estimate_gauge_upgrades
  has_many :estimates, through: :estimate_gauge_upgrades
end

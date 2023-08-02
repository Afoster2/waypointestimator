class CoolerOption < ApplicationRecord
  belongs_to :boat_model
  has_many :estimate_cooler_options
  has_many :estimates, through: :estimate_cooler_options
end

class FactoryOption < ApplicationRecord
  belongs_to :boat_model
  has_many :estimate_factory_options
  has_many :estimates, through: :estimate_factory_options
end

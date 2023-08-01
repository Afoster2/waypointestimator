class Option < ApplicationRecord
  has_many :boat_model_options
  has_many :boat_models, through: :boat_model_options
  has_many :estimate_options
  has_many :estimates, through: :estimate_options

  validates :name, :price, :option_type, presence: true
end

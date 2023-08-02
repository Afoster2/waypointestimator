class AdditionalOption < ApplicationRecord
  belongs_to :boat_model
  has_many :estimate_additional_options
  has_many :estimates, through: :estimate_additional_options
end

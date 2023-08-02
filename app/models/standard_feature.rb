class StandardFeature < ApplicationRecord
  belongs_to :boat_model
  has_many :estimate_standard_features
  has_many :estimates, through: :estimate_standard_features
end

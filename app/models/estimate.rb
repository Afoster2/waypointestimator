class Estimate < ApplicationRecord
  belongs_to :customer
  belongs_to :user
  belongs_to :boat_model
  has_many :estimate_options
  has_many :options, through: :estimate_options

  validates :user_id, :boat_model_id, presence: true

end

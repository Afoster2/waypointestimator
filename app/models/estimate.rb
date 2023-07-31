class Estimate < ApplicationRecord
  belongs_to :user
  belongs_to :boat_model

  validates :user_id, :boat_model_id, presence: true

end

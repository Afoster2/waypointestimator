class EstimateSeatingOption < ApplicationRecord
  belongs_to :estimate
  belongs_to :seating_option
end

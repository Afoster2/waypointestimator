class ConsoleOption < ApplicationRecord
  belongs_to :boat_model
  has_many :estimate_console_options
  has_many :estimates, through: :estimate_console_options
end

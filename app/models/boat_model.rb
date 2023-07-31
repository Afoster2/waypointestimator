class BoatModel < ApplicationRecord
	has_many :estimates
	has_many :boat_model_options
	has_many :options, through: :boat_model_options

	validates :length, :beam, :max_hp, :hull_weight, :max_passengers, :price_hull, :price_trailer_hull, :name, :stock_number, :style, :year, presence: true

end

class BoatModel < ApplicationRecord
	has_many :estimates
	has_many :boat_model_options
	has_many :options, through: :boat_model_options

	validates :length, :beam, :max_hp, :hull_weight, :max_passengers, :price_hull, :price_trailer_hull, :name, :stock_number, :style, :year, presence: true

  def boat_full_name
    "#{year} #{name} #{style}"
  end

  has_many :standard_features, dependent: :destroy
  has_many :power_options, dependent: :destroy
  has_many :console_options, dependent: :destroy
  has_many :factory_options, dependent: :destroy
  has_many :gauge_upgrades, dependent: :destroy
  has_many :seating_options, dependent: :destroy
  has_many :aluminum_options, dependent: :destroy
  has_many :lighting_options, dependent: :destroy
  has_many :finishing_options, dependent: :destroy
  has_many :cooler_options, dependent: :destroy
  has_many :wetsound_packages, dependent: :destroy
  has_many :additional_options, dependent: :destroy
  has_many :trailer_upgrades, dependent: :destroy


  accepts_nested_attributes_for :standard_features, allow_destroy: true
  accepts_nested_attributes_for :power_options, allow_destroy: true
  accepts_nested_attributes_for :console_options, allow_destroy: true
  accepts_nested_attributes_for :factory_options, allow_destroy: true
  accepts_nested_attributes_for :gauge_upgrades, allow_destroy: true
  accepts_nested_attributes_for :seating_options, allow_destroy: true
  accepts_nested_attributes_for :aluminum_options, allow_destroy: true
  accepts_nested_attributes_for :lighting_options, allow_destroy: true
  accepts_nested_attributes_for :finishing_options, allow_destroy: true
  accepts_nested_attributes_for :cooler_options, allow_destroy: true
  accepts_nested_attributes_for :wetsound_packages, allow_destroy: true
  accepts_nested_attributes_for :additional_options, allow_destroy: true
  accepts_nested_attributes_for :trailer_upgrades, allow_destroy: true

end

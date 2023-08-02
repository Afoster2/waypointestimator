class Estimate < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  belongs_to :boat_model

  has_many :estimate_standard_features
  has_many :standard_features, through: :estimate_standard_features

  has_many :estimate_power_options
  has_many :power_options, through: :estimate_power_options

  has_many :estimate_console_options
  has_many :console_options, through: :estimate_console_options

  has_many :estimate_factory_options
  has_many :factory_options, through: :estimate_factory_options

  has_many :estimate_gauge_upgrades
  has_many :gauge_upgrades, through: :estimate_gauge_upgrades

  has_many :estimate_seating_options
  has_many :seating_options, through: :estimate_seating_options

  has_many :estimate_aluminum_options
  has_many :aluminum_options, through: :estimate_aluminum_options

  has_many :estimate_lighting_options
  has_many :lighting_options, through: :estimate_lighting_options

  has_many :estimate_finishing_options
  has_many :finishing_options, through: :estimate_finishing_options

  has_many :estimate_cooler_options
  has_many :cooler_options, through: :estimate_cooler_options

  has_many :estimate_wetsound_packages
  has_many :wetsound_packages, through: :estimate_wetsound_packages

  has_many :estimate_additional_options
  has_many :additional_options, through: :estimate_additional_options

  has_many :estimate_trailer_upgrades
  has_many :trailer_upgrades, through: :estimate_trailer_upgrades

  validates :user_id, :boat_model_id, presence: true

end

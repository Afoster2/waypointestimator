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
  validates :customer, presence: true

  attr_accessor :power_options_ids, :console_options_ids, :factory_options_ids, :gauge_upgrades_ids, :seating_options_ids, :aluminum_options_ids, :lighting_options_ids, :finishing_options_ids, :cooler_options_ids, :wetsound_packages_ids, :additional_options_ids, :trailer_upgrades_ids


  #totals for options

  def power_options_total
    power_options_total = power_options.sum(:price)
  end

  def console_options_total
    console_options_total = console_options.sum(:price)
  end

  def factory_options_total
    factory_options_total = factory_options.sum(:price)
  end

  def gauge_upgrades_total
    gauge_upgrades_total = gauge_upgrades.sum(:price)
  end

  def seating_options_total
    seating_options_total = seating_options.sum(:price)
  end

  def aluminum_options_total
    aluminum_options_total = aluminum_options.sum(:price)
  end

  def finishing_options_total
    finishing_options_total = finishing_options.sum(:price)
  end

  def lighting_options_total
    lighting_options_total = lighting_options.sum(:price)
  end

  def cooler_options_total
    cooler_options_total = cooler_options.sum(:price)
  end

  def wetsound_packages_total
    wetsound_packages_total = wetsound_packages.sum(:price)
  end

  def additional_options_total
    additional_options_total = additional_options.sum(:price)
  end

  def trailer_upgrades_total
    trailer_upgrades_total = trailer_upgrades.sum(:price)
  end

  #financing parts

  def subtotal_pre_tax
      subtotal_pre_tax = boat_model.price_trailer_hull + boat_model.price_hull + power_options_total + console_options_total + factory_options_total + gauge_upgrades_total + seating_options_total + aluminum_options_total + lighting_options_total + finishing_options_total + cooler_options_total + wetsound_packages_total + additional_options_total + trailer_upgrades_total
  end

  def tax
    tax = subtotal_pre_tax * 625/10000.to_f
  end

  def vit
    vit = subtotal_pre_tax * 2104/1000000.to_f
  end

  def total_price
    total_price = subtotal_pre_tax + tax + vit + 125 + 250
  end

  def ten_total_price
    ten_total_price = total_price * 10/100
  end

  def fifteen_total_price
    fifteen_total_price = total_price * 15/100
  end

  def twenty_total_price
    twenty_total_price = total_price * 20/100
  end

  def ten_grand_total_price
    ten_grand_total_price = total_price - ten_total_price
  end

  def fifteen_grand_total_price
    fifteen_grand_total_price = total_price - fifteen_total_price
  end

  def twenty_grand_total_price
    twenty_grand_total_price = total_price - twenty_total_price
  end

end

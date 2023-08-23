class AddPriceHullAndPriceTrailerHullToEstimates < ActiveRecord::Migration[7.0]
  def change
    add_column :estimates, :price_hull, :decimal
    add_column :estimates, :price_trailer_hull, :decimal
  end
end

class AddDetailsToBoatModels < ActiveRecord::Migration[7.0]
  def change
    add_column :boat_models, :name, :string
    add_column :boat_models, :stock_number, :integer
    add_column :boat_models, :style, :string
  end
end

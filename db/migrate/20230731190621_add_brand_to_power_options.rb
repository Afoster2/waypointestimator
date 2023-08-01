class AddBrandToPowerOptions < ActiveRecord::Migration[7.0]
  def change
    add_column :power_options, :brand, :string
  end
end

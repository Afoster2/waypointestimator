class RenameNameToModelNumberInPowerOptions < ActiveRecord::Migration[7.0]
  def change
    rename_column :power_options, :name, :model_number
  end
end

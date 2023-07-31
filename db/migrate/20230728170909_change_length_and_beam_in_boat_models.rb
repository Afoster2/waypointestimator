class ChangeLengthAndBeamInBoatModels < ActiveRecord::Migration[7.0]
  def change
    change_column :boat_models, :length, :string
    change_column :boat_models, :beam, :string
  end
end

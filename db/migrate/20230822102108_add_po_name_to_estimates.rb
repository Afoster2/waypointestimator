class AddPoNameToEstimates < ActiveRecord::Migration[7.0]
  def change
    add_column :estimates, :po_name, :string
  end
end

class AddCustomerIdToEstimates < ActiveRecord::Migration[7.0]
  def change
    add_column :estimates, :customer_id, :integer
  end
end

class RemoveSalespersonIdFromCustomers < ActiveRecord::Migration[7.0]
  def change
    remove_column :customers, :salesperson_id, :integer
  end
end

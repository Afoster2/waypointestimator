class AddDetailsToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :address2, :string
    add_column :customers, :city, :string
    add_column :customers, :state, :string
    add_column :customers, :zip, :string
    add_column :customers, :date_contacted, :date
    add_column :customers, :location, :string
    add_column :customers, :notes, :text
  end
end

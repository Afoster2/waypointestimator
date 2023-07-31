class CreateEstimates < ActiveRecord::Migration[7.0]
  def change
    create_table :estimates do |t|
      t.references :user, null: false, foreign_key: true
      t.references :boat_model, null: false, foreign_key: true
      t.decimal :subtotal
      t.decimal :tax
      t.decimal :vit
      t.decimal :doc_fee
      t.decimal :registration
      t.decimal :total_price

      t.timestamps
    end
  end
end

class CreatePowerOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :power_options do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :engine_model
      t.string :engine_make
      t.integer :year
      t.string :serial_number
      t.references :boat_model, null: false, foreign_key: true

      t.timestamps
    end
  end
end

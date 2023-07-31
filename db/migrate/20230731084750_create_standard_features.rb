class CreateStandardFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :standard_features do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.references :boat_model, null: false, foreign_key: true

      t.timestamps
    end
  end
end

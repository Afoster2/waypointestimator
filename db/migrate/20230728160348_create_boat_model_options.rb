class CreateBoatModelOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :boat_model_options do |t|
      t.references :boat_model, null: false, foreign_key: true
      t.references :option, null: false, foreign_key: true

      t.timestamps
    end
  end
end

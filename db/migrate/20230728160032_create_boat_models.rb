class CreateBoatModels < ActiveRecord::Migration[7.0]
  def change
    create_table :boat_models do |t|
      t.integer :length
      t.integer :beam
      t.integer :max_hp
      t.integer :hull_weight
      t.integer :max_passengers
      t.decimal :price_hull
      t.decimal :price_trailer_hull

      t.timestamps
    end
  end
end

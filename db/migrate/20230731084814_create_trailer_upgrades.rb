class CreateTrailerUpgrades < ActiveRecord::Migration[7.0]
  def change
    create_table :trailer_upgrades do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.references :boat_model, null: false, foreign_key: true

      t.timestamps
    end
  end
end

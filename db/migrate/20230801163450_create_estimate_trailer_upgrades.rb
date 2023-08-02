class CreateEstimateTrailerUpgrades < ActiveRecord::Migration[7.0]
  def change
    create_table :estimate_trailer_upgrades do |t|
      t.references :estimate, null: false, foreign_key: true
      t.references :trailer_upgrade, null: false, foreign_key: true

      t.timestamps
    end
  end
end

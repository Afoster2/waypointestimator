class CreateEstimateGaugeUpgrades < ActiveRecord::Migration[7.0]
  def change
    create_table :estimate_gauge_upgrades do |t|
      t.references :estimate, null: false, foreign_key: true
      t.references :gauge_upgrade, null: false, foreign_key: true

      t.timestamps
    end
  end
end

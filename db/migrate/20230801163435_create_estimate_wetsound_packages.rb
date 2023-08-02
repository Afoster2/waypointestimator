class CreateEstimateWetsoundPackages < ActiveRecord::Migration[7.0]
  def change
    create_table :estimate_wetsound_packages do |t|
      t.references :estimate, null: false, foreign_key: true
      t.references :wetsound_package, null: false, foreign_key: true

      t.timestamps
    end
  end
end

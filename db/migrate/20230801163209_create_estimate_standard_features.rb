class CreateEstimateStandardFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :estimate_standard_features do |t|
      t.references :estimate, null: false, foreign_key: true
      t.references :standard_feature, null: false, foreign_key: true

      t.timestamps
    end
  end
end

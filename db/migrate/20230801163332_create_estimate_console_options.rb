class CreateEstimateConsoleOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :estimate_console_options do |t|
      t.references :estimate, null: false, foreign_key: true
      t.references :console_option, null: false, foreign_key: true

      t.timestamps
    end
  end
end

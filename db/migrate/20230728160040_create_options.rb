class CreateOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :options do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :option_type

      t.timestamps
    end
  end
end

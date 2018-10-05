class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :merchant, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :unit_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end

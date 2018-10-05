class CreateInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_items do |t|
      t.references :item, foreign_key: true
      t.references :invoice, foreign_key: true
      t.decimal :unit_price, precision: 10, scale: 2
      t.integer :quantity

      t.timestamps
    end
  end
end

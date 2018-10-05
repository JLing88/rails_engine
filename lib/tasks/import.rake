require 'csv'

namespace :import do
  desc "Import data from CSV file"

  task data: :environment do
    CSV.foreach('./db/data/merchants.csv', headers: true, header_converters: :symbol) do |row|
      Merchant.create(row.to_h)
    end

    CSV.foreach('./db/data/customers.csv', headers: true, header_converters: :symbol) do |row|
      Customer.create(row.to_h)
    end

    CSV.foreach('./db/data/invoices.csv', headers: true, header_converters: :symbol) do |row|
      Invoice.create(row.to_h)
    end

    CSV.foreach('./db/data/items.csv', headers: true, header_converters: :symbol) do |row|
      row[:unit_price] = row[:unit_price].to_f / 100
      Item.create(row.to_h)
    end

    CSV.foreach('./db/data/invoice_items.csv', headers: true, header_converters: :symbol) do |row|
      row[:unit_price] = row[:unit_price].to_f / 100
      InvoiceItem.create(row.to_h)
    end

    CSV.foreach('./db/data/transactions.csv', headers: true, header_converters: :symbol) do |row|
      Transaction.create(row.to_h)
    end

  end
end

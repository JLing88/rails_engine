require 'rails_helper'

describe "Invoice Relationships API" do
  it "finds all associated transactions for an invoice" do
    invoice = create(:invoice)
    invoice_2 = create(:invoice)
    id = invoice.id

    create_list(:transaction, 10, invoice: invoice)
    create_list(:transaction, 10, invoice: invoice_2)

    get "/api/v1/invoices/#{id}/transactions"

    invoice_transactions = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_transactions.count).to eq(10)
  end

  it 'finds all associated invoice_items for an invoice' do
    invoice = create(:invoice)
    invoice_2 = create(:invoice)

    id = invoice.id

    create_list(:invoice_item, 10, invoice: invoice)
    create_list(:invoice_item, 10, invoice: invoice_2)

    get "/api/v1/invoices/#{id}/invoice_items"

    invoice_invoice_items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_invoice_items.count).to eq(10)
  end

  it 'finds all associated items for an invoice' do
    invoice = create(:invoice)
    invoice_2 = create(:invoice)

    id = invoice.id

    items = create_list(:item, 10)
    items_2 = create_list(:item, 10)

    items.each do |item|
      create(:invoice_item, item: item, invoice: invoice)
    end

    items_2.each do |item|
      create(:invoice_item, item: item, invoice: invoice_2)
    end

    get "/api/v1/invoices/#{id}/items"

    invoice_items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_items.count).to eq(10)
  end

  it 'finds the associated customer for an invoice' do
    customer = create(:customer)
    invoice = create(:invoice, customer: customer)
    id = invoice.id

    get "/api/v1/invoices/#{id}/customer"

    invoice_customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_customer.id).to eq(customer.id)
  end
end

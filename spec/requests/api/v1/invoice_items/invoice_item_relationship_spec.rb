require 'rails_helper'

describe "InvoiceItem Relationships API" do
  it 'finds the associated invoice for an invoice_item' do
    invoice = create(:invoice)
    invoice_2 = create(:invoice)

    invoice_item = create(:invoice_item, invoice: invoice)
    invoice_item_2 = create(:invoice_item, invoice: invoice_2)

    id = invoice_item.id

    get "/api/v1/invoice_items/#{id}/invoice"

    invoice_item_invoice = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item_invoice["id"]).to eq(id)
  end

  it 'finds the associated item for an invoice_item' do
    item = create(:item)
    item_2 = create(:item)

    invoice_item = create(:invoice_item, item: item)
    invoice_item_2 = create(:invoice_item, item: item_2)

    id = invoice_item.id

    get "/api/v1/invoice_items/#{id}/item"

    invoice_item_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item_item["id"]).to eq(id)
  end
end

require 'rails_helper'

describe "InvoiceItem API" do
  it 'sends a list of all invoice items' do
    create_list(:invoice_item, 5)

    get '/api/v1/invoice_items.json'

    invoice_items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_items.count).to eq(5)
  end
end

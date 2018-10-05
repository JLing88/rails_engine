require 'rails_helper'

describe "Invoice Item Random API" do
  it 'finds a random invoice_item' do
    create_list(:invoice_item, 10)

    get '/api/v1/invoice_items/random.json'

    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item.count).to eq(1)
  end
end

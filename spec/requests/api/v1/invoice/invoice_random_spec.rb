require 'rails_helper'

describe 'Invoice Random API' do
  it 'finds a random invoice' do
    create_list(:invoice, 10)

    get '/api/v1/invoices/random.json'

    invoice = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice.count).to eq(1)
  end
end

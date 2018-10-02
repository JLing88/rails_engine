require 'rails_helper'

describe 'Invoices API' do
  it 'sends a list of all invoices' do
    create_list(:invoice, 5)

    get '/api/v1/invoices.json'
    invoices = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoices.count).to eq(5)
  end
end

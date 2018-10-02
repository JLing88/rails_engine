require 'rails_helper'

describe 'Invoices API' do
  it 'sends a list of all invoices' do
    create_list(:invoice, 5)

    get '/api/v1/invoices.json'
    invoices = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoices.count).to eq(5)
  end

  it 'can get one invoice by id' do
    id = create(:invoice).id

    get '/api/v1/invoices/1.json'

    invoice = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice["id"]).to eq(id)
  end
end

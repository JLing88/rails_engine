require 'rails_helper'

describe "Transaction Relationship API" do
  it 'finds the associated invoice for a transaction' do
    invoice = create(:invoice)
    transaction = create(:transaction, invoice: invoice)
    id = transaction.id

    get "/api/v1/transactions/#{id}/invoice"\

    tx_invoice = JSON.parse(response.body)

    expect(response).to be_successful
    expect(tx_invoice["id"]).to eq(invoice.id)

  end
end

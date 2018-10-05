require 'rails_helper'

describe 'Customer Relationships Endpoints' do
  it 'finds all associated transactions for a customer' do
    customer_1 = create(:customer)
    id = customer_1.id

    invoices = [create(:invoice), create(:invoice), create(:invoice)]
    customer_1.invoices << invoices

    tx_1 = create(:transaction, invoice: invoices[0])
    tx_2 = create(:transaction, invoice: invoices[1])
    tx_3 = create(:transaction, invoice: invoices[2])

    get "/api/v1/customers/#{id}/transactions"

    customer_transactions = JSON.parse(response.body)
    expect(response).to be_successful
    expect(customer_transactions.count).to eq(3)
  end

  it 'finds all associated invoices for a customer' do
    customer_1 = create(:customer)
    id = customer_1.id

    invoices = [create(:invoice), create(:invoice), create(:invoice)]
    customer_1.invoices << invoices

    get "/api/v1/customers/#{id}/invoices"

    customer_invoices = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer_invoices.count).to eq(3)
  end
end

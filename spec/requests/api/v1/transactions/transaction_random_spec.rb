require 'rails_helper'

describe "Transaction Random API" do
  it 'finds a random transaction' do
    create_list(:transaction, 5)

    get '/api/v1/transactions/random.json'

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction.count).to eq(1)
  end
end

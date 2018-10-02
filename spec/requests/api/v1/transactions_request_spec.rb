require 'rails_helper'

describe "Transactions API" do
  it "sends a list of all transactions" do
    create_list(:transaction, 5)

    get '/api/v1/transactions.json'

    invoices = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoices.count).to eq(5)
  end

  it "can get one transaction by id" do
    id = create(:transaction).id

    get '/api/v1/transactions/1.json'

    tx = JSON.parse(response.body)

    expect(response).to be_successful
    expect(tx["id"]).to eq(id)
  end
end

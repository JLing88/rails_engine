require 'rails_helper'

describe "Transactions Find API" do
  context 'find params' do
    it 'finds a transaction by name' do
      id = create(:transaction).id

      get "/api/v1/transactions/find?id=#{id}"

      transaction = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transaction["id"]).to eq(id)
    end
  end

  context 'find_all params' do
    it 'finds all tranactions by id' do
      id = create(:transaction).id
      create(:transaction)
      create(:transaction)
      create(:transaction)

      get "/api/v1/transactions/find_all?id=#{id}"

      transactions = JSON.parse(response.body)

      expect(response).to be_successful
      expect(transactions.count).to eq(1)
    end
  end
end

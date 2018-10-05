require 'rails_helper'

describe "Merchants Find API" do
  context "find params" do
    it 'finds a merchant by id' do
      id = create(:merchant).id

      get "/api/v1/merchants/find?id=#{id}"

      merchant = JSON.parse(response.body)

      expect(response).to be_successful
      expect(merchant["id"]).to eq(id)
    end

    it 'finds a merchant by name' do
      name = create(:merchant).name

      get "/api/v1/merchants/find?name=#{name}"

      merchant = JSON.parse(response.body)

      expect(response).to be_successful
      expect(merchant["name"]).to eq(name)
    end

    it 'finds a merchant by created_at' do
      ruby_merchant = create(:merchant, created_at: "2018-10-3")
      date = ruby_merchant.created_at

      get "/api/v1/merchants/find?created_at=#{date}"

      merchant = JSON.parse(response.body)

      expect(response).to be_successful
      expect(merchant["name"]).to eq(ruby_merchant.name)
    end

    it 'finds a merchant by updated_at' do
      ruby_merchant = create(:merchant, updated_at: "2018-10-3")
      date = ruby_merchant.updated_at

      get "/api/v1/merchants/find?updated_at=#{date}"

      merchant = JSON.parse(response.body)

      expect(response).to be_successful
      expect(merchant["name"]).to eq(ruby_merchant.name)
    end
  end

  context "find_all params" do
    it 'finds all merchants by id' do
      id = create(:merchant).id
      create(:merchant)
      create(:merchant, name: "Google")
      create(:merchant, name: "Microsoft")

      get "/api/v1/merchants/find_all?id=#{id}"

      merchants = JSON.parse(response.body)

      expect(response).to be_successful
      expect(merchants.count).to eq(1)
    end

    it 'finds all merchants by name' do
      name = create(:merchant).name
      create(:merchant)
      create(:merchant, name: "Google")
      create(:merchant, name: "Microsoft")

      get "/api/v1/merchants/find_all?name=#{name}"

      merchants = JSON.parse(response.body)

      expect(response).to be_successful
      expect(merchants.count).to eq(2)
    end

    it 'finds all merchants by created_at' do
      created_at = create(:merchant, created_at: "2018-10-2").created_at
      create(:merchant)
      create(:merchant, created_at: "2018-10-2")
      create(:merchant, created_at: "2018-10-2")

      get "/api/v1/merchants/find_all?created_at=#{created_at}"

      merchants = JSON.parse(response.body)
      expect(response).to be_successful
      expect(merchants.count).to eq(3)
    end

    it 'finds all merchants by updated_at' do
      updated_at = create(:merchant, updated_at: "2018-10-2").updated_at
      create(:merchant)
      create(:merchant, updated_at: "2018-10-2")
      create(:merchant, updated_at: "2018-10-2")

      get "/api/v1/merchants/find_all?updated_at=#{updated_at}"

      merchants = JSON.parse(response.body)
      expect(response).to be_successful
      expect(merchants.count).to eq(3)
    end
  end
end

require 'rails_helper'

describe "Items Find API" do
  context "find params" do
    it 'finds an item by id' do
      id = create(:item).id

      get "/api/v1/items/find?id=#{id}"

      item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(item["id"]).to eq(id)
    end

    it 'finds an item by name' do
      name = create(:item).name

      get "/api/v1/items/find?name=#{name}"

      item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(item["name"]).to eq(name)
    end

    it 'finds an item by description' do
      description = create(:item).description

      get "/api/v1/items/find?description=#{description}"

      item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(item["description"]).to eq(description)
    end

    it 'finds an item by unit_price' do
      unit_price = create(:item).unit_price

      get "/api/v1/items/find?unit_price=#{unit_price}"

      item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(item["unit_price"]).to eq(unit_price)
    end

    it 'finds an item by created_at' do
      item = create(:item, created_at: "2018-10-3")
      date = item.created_at
      name = item.name

      get "/api/v1/items/find?created_at=#{date}"

      item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(item["name"]).to eq(name)
    end

    it 'finds an item by updated_at' do
      item = create(:item, updated_at: "2018-10-3")
      date = item.updated_at
      name = item.name

      get "/api/v1/items/find?updated_at=#{date}"

      item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(item["name"]).to eq(name)
    end
  end

  context "find_all params" do
    it 'finds all items by name' do
      create(:item, name: "Thing 1")
      create(:item, name: "Thing 1")
      create(:item, name: "Thing 1")
      create(:item, name: "Thing 2")

      get "/api/v1/items/find_all?name=Thing%201"

      items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(items.count).to eq(3)
    end

    it 'finds all items by description' do
      create(:item, description: "Description 1")
      create(:item, description: "Description 1")
      create(:item, description: "Thing 1")
      create(:item, description: "Thing 2")

      get "/api/v1/items/find_all?description=Description%201"

      items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(items.count).to eq(2)
    end

    it 'finds all items by unit_price' do
      create(:item, unit_price: 100)
      create(:item, unit_price: 100)
      create(:item, unit_price: 200)
      create(:item, unit_price: 200)

      get "/api/v1/items/find_all?unit_price=200"

      items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(items.count).to eq(2)
    end

    it 'finds all items by merchant_id' do
      create(:item, unit_price: 100)
      create(:item, unit_price: 100)
      create(:item, unit_price: 200)
      create(:item, unit_price: 200)

      get "/api/v1/items/find_all?unit_price=200"

      items = JSON.parse(response.body)

      expect(response).to be_successful
      expect(items.count).to eq(2)
    end
  end
end

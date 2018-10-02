require 'rails_helper'

describe "Items API" do
  it 'sends a list of all items' do
    create_list(:item, 5)

    get '/api/v1/items.json'

    items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(items.count).to eq(5)
  end

  it 'can get one item by id' do
    id = create(:item).id
    get '/api/v1/items/1.json'

    item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item["id"]).to eq(id)
  end
end

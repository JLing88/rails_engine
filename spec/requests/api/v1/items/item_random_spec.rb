require 'rails_helper'

describe "Item Random API" do
  it 'finds a random item' do
    create_list(:item, 10)

    get '/api/v1/items/random.json'

    item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item.count).to eq(1)
  end
end

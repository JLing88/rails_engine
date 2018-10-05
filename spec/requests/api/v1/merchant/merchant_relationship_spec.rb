require 'rails_helper'

describe "Merchant Relationships API" do
  it 'finds all associated items for a merchant' do
    merchant = create(:merchant)
    merchant_2 = create(:merchant)
    id = merchant.id

    items = [create(:item), create(:item), create(:item)]

    create_list(:item, 3, merchant: merchant_2)

    merchant.items << items

    get "/api/v1/merchants/#{id}/items"

    merchant_items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant_items.count).to eq(3)
  end
end

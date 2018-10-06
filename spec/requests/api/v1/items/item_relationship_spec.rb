require 'rails_helper'

describe "Item Relationships API" do
  it "finds all associated invoice_items for an item" do
    item = create(:item)
    item_2 = create(:item)

    id = item.id

    create_list(:invoice_item, 10, item: item)
    create_list(:invoice_item, 11, item: item_2)

    get "/api/v1/items/#{id}/invoice_items"

    item_invoice_items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item_invoice_items.count).to eq(10)
  end

  it 'find the associated merchant for an item' do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    item_2 = create(:item)

    id = item.id

    get "/api/v1/items/#{id}/merchant"

    item_merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item_merchant["id"]).to eq(merchant.id)
  end
end

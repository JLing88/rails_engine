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

  it 'finds all associated invoices for a merchant' do
    merchant = create(:merchant)
    merchant_2 = create(:merchant)

    create_list(:invoice, 10, merchant: merchant)
    create_list(:invoice, 10, merchant: merchant_2)

    id = merchant.id


    get "/api/v1/merchants/#{id}/invoices"

    merchant_invoices = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant_invoices.count).to eq(10)
  end
end

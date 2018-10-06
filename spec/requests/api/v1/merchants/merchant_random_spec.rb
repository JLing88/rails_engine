require 'rails_helper'

describe "Merchant Random API" do
  it "finds one random merchant" do
    create_list(:merchant, 10)

    get '/api/v1/merchants/random.json'

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant.count).to eq(1)
  end
end

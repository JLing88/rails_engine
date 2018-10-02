require 'rails_helper'

describe "Customers Find API" do
  it "finds a customer by id" do
    id = create(:customer).id

    get "/api/v1/customers/find?id=#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["id"]).to eq(id)
  end

  it 'finds a customer by first_name' do
    first_name = create(:customer).first_name
    create(:customer, first_name: "Jesse", last_name: "Ling")

    get "/api/v1/customers/find?first_name=Chuck"

    customer = JSON.parse(response.body)
    expect(response).to be_successful
    expect(customer["first_name"]).to eq(first_name)
  end

  it 'finds a customer by last_name' do
    last_name = create(:customer).last_name
    create(:customer, first_name: "Joe", last_name: "Schmoe")

    get "/api/v1/customers/find?last_name=#{last_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["last_name"]).to eq(last_name)
  end

  it 'finds a customer by created_at' do
    created_at = create(:customer, created_at: "2018-12-10").created_at.to_date
    create(:customer, created_at: Date.yesterday)

    get "/api/v1/customers/find?created_at=#{created_at}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["created_at"].to_date).to eq(created_at)
  end
  it 'finds a customer by updated_at' do
    updated_at = create(:customer, updated_at: "2018-12-10").updated_at.to_date
    create(:customer, updated_at: Date.yesterday)

    get "/api/v1/customers/find?updated_at=#{updated_at}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["updated_at"].to_date).to eq(updated_at)
  end
end

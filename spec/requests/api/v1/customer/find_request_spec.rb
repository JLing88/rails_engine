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

    get "/api/v1/customers/find?first_name=Mike"
  end
end

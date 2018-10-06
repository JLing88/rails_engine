require 'rails_helper'

describe "Customer Random API" do
  it 'finds a random customer' do
    create_list(:customer, 10)

    get '/api/v1/customers/random.json'

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer.count).to eq(1)
  end
end

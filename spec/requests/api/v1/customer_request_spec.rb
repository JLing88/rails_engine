require 'rails_helper'

describe 'Customers API' do
  it 'sends a list of all customers' do
    create_list(:customer, 5)

    get '/api/v1/customers.json'

    customers = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customers.count).to eq(5)
  end

  it 'can get one customer by id' do
    id = create(:customer).id

    get '/api/v1/customers/1.json'

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["id"]).to eq(id)
  end
end

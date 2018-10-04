require 'rails_helper'

describe "Customers Find API" do
  context "find params" do
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
      cust_1 = Customer.create!(first_name: "Jesse",
                                last_name: "Ling",
                                created_at: "2018-08-08",
                                updated_at: "2018-08-08")

      cust_2 = Customer.create!(first_name: "James",
                                last_name: "Brown",
                                created_at: "2018-08-09",
                                updated_at: "2018-08-09")

      cust_3 = Customer.create!(first_name: "Mary",
                                last_name: "Templeton",
                                created_at: "2018-08-10",
                                updated_at: "2018-08-10")

      cust_4 = Customer.create!(first_name: "Teddy",
                                last_name: "Roosevelt",
                                created_at: "2018-08-11",
                                updated_at: "2018-08-11")

      created_at = cust_4.created_at

      get "/api/v1/customers/find?created_at=#{created_at}"

      customer = JSON.parse(response.body)

      expect(response).to be_successful
      expect(customer["first_name"]).to eq(cust_4.first_name)
    end

    it 'finds a customer by updated_at' do
      cust_1 = Customer.create!(first_name: "Jesse",
                                last_name: "Ling",
                                created_at: "2018-08-08",
                                updated_at: "2018-08-08")

      cust_2 = Customer.create!(first_name: "James",
                                last_name: "Brown",
                                created_at: "2018-08-09",
                                updated_at: "2018-08-09")

      cust_3 = Customer.create!(first_name: "Mary",
                                last_name: "Templeton",
                                created_at: "2018-08-10",
                                updated_at: "2018-08-10")

      cust_4 = Customer.create!(first_name: "Teddy",
                                last_name: "Roosevelt",
                                created_at: "2018-08-11",
                                updated_at: "2018-08-11")

      updated_at = cust_4.updated_at

      get "/api/v1/customers/find?updated_at=#{updated_at}"

      customer = JSON.parse(response.body)

      expect(response).to be_successful
      expect(customer["first_name"]).to eq(cust_4.first_name)
    end
  end

  context 'find_all params' do
    it 'finds all customers by first_name' do
      first_name = create(:customer).first_name
      create(:customer)
      create(:customer)
      create(:customer)
      create(:customer, first_name: "Bob")

      get "/api/v1/customers/find_all?first_name=#{first_name}"

      customers = JSON.parse(response.body)

      expect(response).to be_successful
      expect(customers.count).to eq(4)
    end
    it 'finds all customers by last_name' do
      last_name = create(:customer).last_name
      create(:customer)
      create(:customer)
      create(:customer)
      create(:customer, last_name: "Bob")

      get "/api/v1/customers/find_all?last_name=#{last_name}"

      customers = JSON.parse(response.body)

      expect(response).to be_successful
      expect(customers.count).to eq(4)
    end
    it 'finds all customers by created_at' do
      cust_1 = Customer.create!(first_name: "Jesse",
                       last_name: "Ling",
                       created_at: "2018-08-08",
                       updated_at: "2018-08-08")
      cust_2 = Customer.create!(first_name: "Jesse",
                       last_name: "Ling",
                       created_at: "2018-08-08",
                       updated_at: "2018-08-08")
      cust_3 = Customer.create!(first_name: "Jesse",
                       last_name: "Ling",
                       created_at: "2018-08-08",
                       updated_at: "2018-08-08")
      cust_4 = Customer.create!(first_name: "Teddy",
                       last_name: "Roosevelt",
                       created_at: "2018-08-09",
                       updated_at: "2018-08-09")

      created_at = cust_1.created_at

      get "/api/v1/customers/find_all?created_at=#{created_at}"

      customers = JSON.parse(response.body)

      expect(response).to be_successful
      expect(customers.count).to eq(3)
    end

    it 'finds all customers by updated_at' do
      cust_1 = Customer.create!(first_name: "Jesse",
                       last_name: "Ling",
                       created_at: "2018-08-08",
                       updated_at: "2018-08-08")
      cust_2 = Customer.create!(first_name: "Jesse",
                       last_name: "Ling",
                       created_at: "2018-08-08",
                       updated_at: "2018-08-08")
      cust_3 = Customer.create!(first_name: "Jesse",
                       last_name: "Ling",
                       created_at: "2018-08-08",
                       updated_at: "2018-08-08")
      cust_4 = Customer.create!(first_name: "Teddy",
                       last_name: "Roosevelt",
                       created_at: "2018-08-09",
                       updated_at: "2018-08-09")

      updated_at = cust_1.updated_at

      get "/api/v1/customers/find_all?updated_at=#{updated_at}"

      customers = JSON.parse(response.body)

      expect(response).to be_successful
      expect(customers.count).to eq(3)
    end
  end
end

require 'rails_helper'

describe "Invoices Find API" do
  context 'find params' do
    it 'finds an invoice by id' do
      id = create(:invoice).id

      get "/api/v1/invoices/find?id=#{id}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice["id"]).to eq(id)
    end

    it 'finds an invoice by customer_id' do
      customer = create(:customer)
      id = create(:invoice, customer_id: customer.id).id

      get "/api/v1/invoices/find?customer_id=#{customer.id}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice["id"]).to eq(id)
    end

    it 'finds an invoice by merchant_id' do
      merchant = create(:merchant)
      id = create(:invoice, merchant_id: merchant.id).id

      get "/api/v1/invoices/find?merchant_id=#{merchant.id}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice["id"]).to eq(id)
    end

    it 'finds an invoice by status' do
      invoice = create(:invoice, status: "shipped")
      id = invoice.id
      status = invoice.status

      get "/api/v1/invoices/find?status=#{status}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice["id"]).to eq(id)
    end

    it 'finds an invoice by created_at' do
      invoice_1 = create(:invoice, created_at: "2018-10-3")
      id = invoice_1.id
      created_at = invoice_1.created_at

      get "/api/v1/invoices/find?created_at=#{created_at}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice["id"]).to eq(id)
    end

    it 'finds an invoice by updated_at' do
      invoice_1 = create(:invoice, updated_at: "2018-10-3")
      id = invoice_1.id
      updated_at = invoice_1.updated_at

      get "/api/v1/invoices/find?updated_at=#{updated_at}"

      invoice = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice["id"]).to eq(id)
    end
  end

  context "find_all params" do
    it 'finds all invoices by id' do
      id = create(:invoice).id
      create(:invoice)
      create(:invoice)

      get "/api/v1/invoices/find_all?id=#{id}"

      invoices = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoices.count).to eq(1)
    end

    it 'finds all invoices by customer_id' do
      customer_id = create(:customer).id
      create(:invoice)
      create(:invoice)
      create(:invoice, customer_id: customer_id)
      create(:invoice, customer_id: customer_id)

      get "/api/v1/invoices/find_all?customer_id=#{customer_id}"

      invoices = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoices.count).to eq(2)
    end

    it 'finds all invoices by merchant_id' do
      merchant_id = create(:merchant).id
      create(:invoice)
      create(:invoice)
      create(:invoice, merchant_id: merchant_id)
      create(:invoice, merchant_id: merchant_id)

      get "/api/v1/invoices/find_all?merchant_id=#{merchant_id}"

      invoices = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoices.count).to eq(2)
    end

    it 'finds all invoices by status' do
      status = create(:invoice).status
      create(:invoice, status: "pending")
      create(:invoice)
      create(:invoice)
      create(:invoice)

      get "/api/v1/invoices/find_all?status=#{status}"

      invoices = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoices.count).to eq(4)
    end

    it 'finds all invoices by created_at' do
      created_at = create(:invoice, created_at: "2018-9-9").created_at
      create(:invoice, created_at: created_at)
      create(:invoice)

      get "/api/v1/invoices/find_all?created_at=#{created_at}"

      invoices = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoices.count).to eq(2)
    end

    it 'finds all invoices by updated_at' do
      updated_at = create(:invoice, updated_at: "2018-9-9").updated_at
      create(:invoice, updated_at: updated_at)
      create(:invoice)

      get "/api/v1/invoices/find_all?updated_at=#{updated_at}"

      invoices = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoices.count).to eq(2)
    end
  end
end

require 'rails_helper'

describe "Invoice Items Find API" do
  context 'find params' do
    it 'finds an invoice_item by id' do
      id = create(:invoice_item).id

      get "/api/v1/invoice_items/find?id=#{id}"

      invoice_item = JSON.parse(response.body)

      expect(response).to be_successful
      expect(invoice_item["id"]).to eq(id)
    end

    context 'find_all params' do
      it 'finds all invoice_items by id' do
        id = create(:invoice_item).id
        create(:invoice_item)
        create(:invoice_item)

        get "/api/v1/invoice_items/find_all?id=#{id}"

        invoice_items = JSON.parse(response.body)

        expect(response).to be_successful
        expect(invoice_items.count).to eq(1)
      end
    end
  end
end

require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  context "Relationships" do
    it { should belong_to :item}
    it { should belong_to :invoice}
  end

  context "Validations" do
    it {should validate_presence_of :quantity}
    it {should validate_presence_of :item_id}
    it {should validate_presence_of :invoice_id}
    it {should validate_presence_of :unit_price}
  end
end

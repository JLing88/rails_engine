FactoryBot.define do
  factory :invoice do
    customer_id { 1 }
    merchant { create(:merchant) }
    customer { create(:customer) }
    status { "completed" }
  end
end

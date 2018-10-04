FactoryBot.define do
  factory :invoice do
    merchant { create(:merchant) }
    customer { create(:customer) }
    status { "completed" }
  end
end

FactoryBot.define do
  factory :item do
    name { "Super Cool Thing" }
    description { "This thing does cool stuff!" }
    unit_price { 100.00 }
    merchant { create(:merchant) }
  end
end

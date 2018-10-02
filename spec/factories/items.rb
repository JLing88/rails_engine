FactoryBot.define do
  factory :item do
    name { "Super Cool Thing" }
    description { "This thing does cool stuff!" }
    unit_price { 1 }
    merchant_id { 1 }
  end
end

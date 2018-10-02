FactoryBot.define do
  factory :transaction do
    invoice { create(:invoice) }
    credit_card_number { "" }
    credit_card_expiration_date { "2018-10-01" }
    result { "success" }
  end
end

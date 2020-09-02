FactoryBot.define do
  factory :order_address do
    postal_cord {"123-4567"}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city {"大阪市"}
    addresses {"阿倍野区"}
    building {"アベノハルカス１階"}
    phone_number {Faker::Number.number(digits: 11)}
    token {"1234567890"}
  end
end
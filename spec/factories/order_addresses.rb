FactoryBot.define do
  factory :order_address do
    postal_cord {"123-4567"}
    prefecture_id {2}
    city {"大阪市"}
    addresses {"阿倍野区"}
    phone_number {"09012341234"}
    token {"1234567890"}
    association :user
    association :item
  end
end
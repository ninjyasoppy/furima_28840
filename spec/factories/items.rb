FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    text {Faker::Lorem.sentence}
    price { '1000'}
    category_id {'2'}
    sales_status_id {'2'}
    shipping_fee_status_id {'2'}
    prefecture_id {'2'}
    scheduled_delivery_id {'2'}
    association :user
    # user_id {'3'}
  end
end

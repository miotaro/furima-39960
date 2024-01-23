FactoryBot.define do
  factory :item do
    product_name      { Faker::Lorem.sentence }
    description       { Faker::Lorem.sentence }
    price             { Faker::Number.between(from: 300, to: 9_999_999).to_i }
    category          { Category.all.sample }
    condition         { Condition.all.sample }
    delivery_charge   { DeliveryCharge.all.sample }
    prefecture        { Prefecture.all.sample }
    delivery_time     { DeliveryTime.all.sample }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end

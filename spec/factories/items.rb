FactoryBot.define do
  factory :item do
    product_name         { Faker::Lorem.sentence }
    description          { Faker::Lorem.sentence }
    price                { Faker::Number.between(from: 300, to: 9_999_999).to_i }
    category_id          { 2 }
    condition_id         { 2 }
    delivery_charge_id   { 2 }
    prefecture_id        { 2 }
    delivery_time_id     { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end

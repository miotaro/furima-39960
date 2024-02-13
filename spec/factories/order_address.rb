FactoryBot.define do
  factory :order_address do
    post_code      { '123-4567' }
    prefecture_id  { 2 }
    municipalities { Faker::Lorem.sentence }
    street_address { Faker::Lorem.sentence }
    building_name  { Faker::Lorem.sentence }
    phone_number   { '09012345678' }
  end
end
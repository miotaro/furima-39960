FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    nickname              { Faker::Name.name }
    first_name            { '山田' }
    last_name             { '太郎' }
    first_name_ruby       { 'ヤマダ' }
    last_name_ruby        { 'タロウ' }
    birthday              { '2000-01-01' }
  end
end

FactoryBot.define do
  factory :owner do
    name Faker::Name.last_name
    email Faker::Internet.free_email
    profile Faker::Name.last_name
    born Faker::Name.last_name
    age Faker::Number.number(2)
    phone_number Faker::Number.number(8)
    password "123456789"
    password_confirmation "123456789"

  end
end

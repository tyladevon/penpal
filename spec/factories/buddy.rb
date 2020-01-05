FactoryBot.define do
  factory :buddy do
    association :user
    email { Faker::Internet.email }
    first_name { Faker::Creature::Dog.name }
    last_name { Faker::Artist.name }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end

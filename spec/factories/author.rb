FactoryBot.define do
  factory :author do
    name { Faker::Name.name }
    bio { Faker::Lorem.sentence }
    education { Faker::Educator.university }
  end
end

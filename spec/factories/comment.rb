FactoryBot.define do
  factory :comment do
    article
    user
    body { Faker::Lorem.sentence }
  end
end

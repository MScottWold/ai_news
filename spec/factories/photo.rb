FactoryBot.define do
  factory :photo do
    article
    alt_text { Faker::Lorem.sentence }
  end
end

FactoryBot.define do
  factory :article do
    author
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.sentence }
    section { Article::SECTIONS.sample }
    featured { true }
    highlighted { true }
    active { true }
  end
end

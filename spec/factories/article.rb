FactoryBot.define do
  factory :article do
    author
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.sentence }
    section { Article::SECTIONS.sample }
    featured { false }
    highlighted { true }
    active { true }

    transient do
      attach_image { false }
      favorited_by { nil }
      commented_by { nil }
    end

    trait :with_image do
      attach_image { true }
    end

    trait :favorited do
      favorited_by { create(:user) }
    end

    trait :commented do
      commented_by { creat(:user) }
    end

    after(:create) do |article, evaluator|
      if evaluator.attach_image
        create(:photo, :with_image, article: article)
      end

      if evaluator.favorited_by
        create(
          :favorite,
          user: evaluator.favorited_by,
          article: article,
        )
      end

      if evaluator.commented_by
        create(
          :comment,
          user: evaluator.commented_by,
          article: article,
        )
      end
    end
  end
end

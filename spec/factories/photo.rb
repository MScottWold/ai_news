FactoryBot.define do
  factory :photo do
    article
    alt_text { Faker::Lorem.sentence }

    transient do
      attach_image { false }
    end

    trait :with_image do
      attach_image { true }
    end

    after(:create) do |photo, evaluator|
      if evaluator.attach_image
        photo.image.attach(create_image_file_blob)
      end
    end
  end
end

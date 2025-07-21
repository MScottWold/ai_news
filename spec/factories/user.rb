FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    password_digest { Faker::Alphanumeric.alphanumeric }
    session_token { nil }
    admin { false }
    email { nil }
    oauth_token { nil }

    trait :with_password do
      password_digest { nil }
      password { Faker::Internet.password(min_length: 8, max_length: 20, mix_case: true, special_characters: true) }
    end
  end
end

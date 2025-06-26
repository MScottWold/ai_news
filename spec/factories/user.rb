FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    password_digest { Faker::Alphanumeric.alphanumeric }
    session_token { nil }
    admin { false }
    email { nil }
    oauth_token { nil }
  end
end

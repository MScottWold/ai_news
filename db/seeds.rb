# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# rubocop:disable Metrics/BlockLength
ActiveRecord::Base.transaction do
  User.create!(
    username: Rails.application.credentials.site_admin[:username],
    password: Rails.application.credentials.site_admin[:password],
    email: Rails.application.credentials.site_admin[:email],
    admin: true,
  )

  Author.create!(
    name: "Sleve McDichael",
    bio: "Sleve covers sports for the AI Times.",
    education: "B.S. Sports History, Blue Mountain State",
    created_at: "2021-02-13 00:07:02 UTC",
    updated_at: "2021-02-13 00:07:02 UTC",
  )

  Author.create!(
    name: "Onson Sweemey",
    bio: "Onson covers politics for the Times. Onson is also a distinguished chair at the Center for Resources and American Politics.",
    education: "Ph.D. Political Scientology, Greendale Community College",
    created_at: "2021-02-13 00:07:02 UTC",
    updated_at: "2021-02-13 00:07:02 UTC",
  )

  Author.create!(
    name: "Rey McSriff",
    bio: "Rey covers all thing business and tech.",
    education: "M.Bs.A, Pennbrook University",
    created_at: "2021-02-13 00:07:02 UTC",
    updated_at: "2021-02-25 22:44:36 UTC",
  )

  Author.create!(
    name: "Willie Dustice",
    bio: "Willie reports on U.S. news",
    education: "Studied Journalism on YouTube",
    created_at: "2021-02-13 00:07:02 UTC",
    updated_at: "2021-02-13 00:07:02 UTC",
  )
end
# rubocop:enable Metrics/BlockLength

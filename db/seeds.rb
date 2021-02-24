# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.create(
    username: Rails.application.credentials.site_admin[:username],
    password: Rails.application.credentials.site_admin[:password],
    admin: true
  )

  Author.create(
    name: 'Onson Sweemey',
    bio: 'Onson covers politics for the Times. Onson is also a distinguished chair at the Center for Resources and American Politics.',
    education: 'Ph.D. Political Scientology, Greendale Community College'
  )
    
  Author.create(
    name: 'Sleve McDichael',
    bio: 'Sleve covers sports for the AI Times.',
    education: 'B.S. Sports History, Blue Mountain State'
  )
    
  Author.create(
    name: 'Rey McSriff',
    bio: 'Willie covers all thing business and tech.',
    education: 'M.Bs.A, Pennbrook University'
  )

  Author.create(
    name: 'Willie Dustice',
    bio: 'Willie reports on U.S. news',
    education: 'Studied Journalism on YouTube'
  )

  Photo.create(
    title: 'White House',
    alt_text: 'United States White House',
    source_url: 'https://farm3.static.flickr.com/2503/4217661984_fec1fcdf69_m.jpg',
    photographer_name: 'Tom Lohdan',
    photographer_url: 'https://www.flickr.com/people/tom_lohdan/',
    license_type: 'CC BY 2.0',
    license_url: 'https://creativecommons.org/licenses/by/2.0/'
  )

  Photo.create(
    title: 'Wembley Arena',
    alt_text: 'Wembley Arena',
    source_url: 'https://farm8.static.flickr.com/7120/7720217718_3ef3f5a2e7_b.jpg',
    photographer_name: 'flashcurd',
    photographer_url: 'https://www.flickr.com/people/flashcurd/',
    license_type: 'CC BY-ND 2.0',
    license_url: 'https://creativecommons.org/licenses/by-nd/2.0/'
  )

  Photo.create(
    title: 'Googleplex',
    alt_text: 'Googleplex business park',
    source_url: 'https://www.flickr.com/photos/rjshade/9620364726/',
    photographer_name: 'rjshade',
    photographer_url: 'https://www.flickr.com/people/rjshade/',
    license_type: 'CC BY 2.0',
    license_url: 'https://creativecommons.org/licenses/by/2.0/'
  )

  Photo.create(
    title: 'Crosswalk',
    alt_text: 'New York City crosswalk',
    source_url: 'https://www.flickr.com/photos/tabor-roeder/30513111324/',
    photographer_name: 'Phil Roeder',
    photographer_url: 'https://www.flickr.com/people/tabor-roeder/',
    license_type: 'CC BY 2.0',
    license_url: 'https://creativecommons.org/licenses/by/2.0/'
  )
end
json.extract! article, :id, :section, :title
json.photo do
  json.partial! 'api/photos/photo', photo: article.photo
  # remove when AWS is set up
  json.photoUrl asset_path("article_photos/#{article.section}.jpg")
end
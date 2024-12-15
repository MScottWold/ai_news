json.extract! article, :id, :section, :title
json.photo do
  json.partial! "api/photos/photo", photo: article.photo
end
json.authorName article.author.name
json.createdAt article.created_at

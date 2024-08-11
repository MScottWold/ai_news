json.extract! article, :id, :section, :title
json.createdAt article.created_at
json.photo do
  json.thumbnailUrl url_for(article.photo.thumbnail)
end
json.extract! article, :id, :section, :title
json.createdAt article.created_at
json.photo do
  json.thumbUrl article.image_attached? ? url_for(article.photo.image.variant(:thumb)) : nil
end

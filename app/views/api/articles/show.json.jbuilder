json.set! @article.id do
  json.extract! @article, :id, :section, :title
  json.createdAt @article.created_at
  json.body @article.body
  json.authorName @article.author.name
  json.authorId @article.author.id
  if logged_in?
    json.favoriteId @article.user_favorite_id(current_user)
  end
  json.photo do
    json.partial! "api/photos/photo", photo: @article.photo
    json.thumbUrl url_for(@article.photo.image.variant(:thumb))
  end
end

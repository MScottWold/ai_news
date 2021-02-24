article_ids = []

json.articles do
  @articles.each do |article|
    article_ids.push(article.id)

    json.set! article.id do
      json.extract! article, :id, :section, :title
      json.createdAt article.created_at
      json.body article.body if @filter_name == "featuredArticleId"
      json.authorName article.author.name
      json.photo do
        json.partial! 'api/photos/photo', photo: article.photo
        # remove when AWS is set up
        json.photoUrl asset_path("article_photos/#{article.section}.jpg")
      end
    end
  end
end

json.set! :articleFilter do
  json.set! @filter_name, article_ids
end
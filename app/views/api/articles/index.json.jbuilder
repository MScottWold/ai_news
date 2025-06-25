article_ids = []

json.articles do
  if @articles.length.zero?
    json.articles({})
  else
    @articles.each do |article|
      article_ids.push(article.id)
      json.set! article.id do
        json.partial! "api/articles/article_list_item", article: article
      end
    end
  end
end

json.set! :filter do
  json.set! @filter, article_ids
end

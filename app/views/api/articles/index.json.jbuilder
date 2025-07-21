article_ids = []

if @articles.empty?
  json.articles({})
else
  json.articles do
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

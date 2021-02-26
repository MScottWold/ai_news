article_ids = []

json.articles do
  @articles.each do |article|
    article_ids.push(article.id)
    json.set! article.id do
      if @filter == "featured"
        json.partial! "api/articles/featured_article", article: article
      else
        json.partial! "api/articles/article_list_item", article: article
      end
    end
  end
end

json.set! :filter do
  json.set! @filter, article_ids
end
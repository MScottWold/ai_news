article_ids = []

json.articles do
  @articles.each do |article|
    article_ids.push(article.id)
    json.set! article.id do
      json.partial! "api/articles/article_list_item", article: article
    end
  end
end
json.articleIds article_ids
json.authorId @author_id

article_ids = []

json.articles do 
  @author.articles.each do |article|
    article_ids.push(article.id)
    json.partial! 'api/articles/article_list_item', article: article
  end
end

json.author do
  json.set! @author.id do
    json.extract! @author, :id, :name, :bio, :education
    json.articleIds article_ids
  end
end

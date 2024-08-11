json.featured do 
  json.partial! "api/articles/featured_article", article: @featured_article
end

json.highlighted do
  json.array! @highlighted_articles do |article|
    json.partial! "api/articles/highlighted_article", article: article
  end
end
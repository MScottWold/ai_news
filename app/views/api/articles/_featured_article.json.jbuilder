json.partial! "api/articles/article_list_item", article: article
json.body article.body
json.authorName article.author.name
json.authorId article.author.id
json.createdAt article.created_at
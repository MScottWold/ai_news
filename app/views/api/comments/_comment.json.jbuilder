json.extract! comment, :id, :article_id
json.date comment.created_at
# don't forget to escape the username and body
json.author comment.user.username
json.body comment.body
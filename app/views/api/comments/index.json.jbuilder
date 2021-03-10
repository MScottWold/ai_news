json.array! @comments do |comment|
  json.partial! "api/comments/comment", comment: comment
end

# comment_ids = []

# json.comments do
#   @comments.each do |comment|
#     json.set! comment.id do
#       comment_ids.push(comment.id)
#       json.partial! "api/comments/comment", comment: comment
#     end
#   end  
# end

# json.commentIds comment_ids
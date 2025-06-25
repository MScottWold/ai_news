class CommentQuery
  def self.for_article(article_id:, after_id:, before_id:)
    new(article_id, after_id, before_id).query
  end

  def initialize(article_id, after_id, before_id)
    @article_id = article_id
    @after_id = after_id
    @before_id = before_id
  end

  def for_article
    if after_id.present?
      base_query.where(comments: { id: (after_id.to_i + 1)... })
    elsif before_id.present?
      base_query.where(comments: { id: ...before_id.to_i })
    else
      base_query
    end
  end

  private

  attr_reader :article_id, :after_id, :before_id

  def base_query
    Comment.where(article_id: article_id).
      order(created_at: :desc).
      limit(10).
      eager_load(:user)
  end
end

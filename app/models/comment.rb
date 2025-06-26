class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :user
  belongs_to :article

  def self.for_article(article_id:, after_id:, before_id:)
    base_query = where(article_id: article_id).
      order(created_at: :desc).
      limit(10).
      eager_load(:user)

    if after_id.present?
      base_query.where(comments: { id: (after_id.to_i + 1)... })
    elsif before_id.present?
      base_query.where(comments: { id: ...before_id.to_i })
    else
      base_query
    end
  end
end

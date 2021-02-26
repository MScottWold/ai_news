# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  body       :text             not null
#  section    :string           not null
#  author_id  :integer          not null
#  photo_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
  validates :title, :body, :author_id, :photo_id, presence: true
  validates :section, presence: true, inclusion: { in: %w(us politics sports business),
    message: "Can only be in the following sections: us politics sports business"}

  belongs_to :author,
    class_name: :Author,
    foreign_key: :author_id,
    primary_key: :id

  belongs_to :photo,
    class_name: :Photo,
    foreign_key: :photo_id,
    primary_key: :id

  # for pagination
  BUCKET_SIZE = 5

  def self.get_latest(after = nil)
    if after
      article = Article
        .where('articles.id < ?', after)
    else
      article = Article
    end

    article.order(created_at: :desc)
      .limit(BUCKET_SIZE)
      .includes(:photo, :author)
  end

  def self.get_section(section, after = nil)
    if after
      articles = Article
        .where("articles.section = ? AND articles.id < ?", section, after)
    else
      articles = Article
        .where(section: section)
    end
    articles.order(created_at: :desc)
      .limit(BUCKET_SIZE)
      .includes(:photo, :author)
  end
end

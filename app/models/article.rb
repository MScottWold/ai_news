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
#  featured   :boolean          default(FALSE)
#
class Article < ApplicationRecord
  validates :title, :body, :author_id, :photo_id, presence: true
  validates :section, presence: true, inclusion: { in: %w(us politics sports business),
    message: "Can only be in the following sections: us politics sports business"}
  validates :featured, inclusion: { in: [true, false] }

  belongs_to :author,
    class_name: :Author,
    foreign_key: :author_id,
    primary_key: :id

  belongs_to :photo,
    class_name: :Photo,
    foreign_key: :photo_id,
    primary_key: :id

  has_many :favorites,
    class_name: :Favorite,
    foreign_key: :article_id,
    primary_key: :id,
    dependent: :destroy

  has_many :readers,
    through: :favorites,
    source: :user

  has_many :comments,
    class_name: :Comment,
    foreign_key: :article_id,
    primary_key: :id,
    dependent: :destroy

  # for pagination
  BUCKET_SIZE = 5

  def self.get_user_favorites(user, after = nil)
    if after
      article = user
        .favorite_articles
        .where('articles.id < ?', after)
    else
      article = user
        .favorite_articles
    end

    article.order(id: :desc)
      .limit(BUCKET_SIZE)
      .eager_load(:photo, :author)
  end

  def self.get_latest(after = nil)
    if after
      article = Article
        .where('articles.id < ?', after)
    else
      article = Article
    end

    article.order(created_at: :desc)
      .limit(BUCKET_SIZE)
      .eager_load(:photo, :author)
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

  def self.get_featured_article
    Article
      .where(featured: true)
      .order(id: :desc)
      .limit(1)
      .eager_load(:author, :photo)
  end

  def self.with_user_favorite(user_id, article_id)
    query = <<-SQL
      SELECT
        articles.*,
        CASE
          WHEN b.article_id IS NULL THEN false
          ELSE true
        END AS favorited
      FROM
        articles
      LEFT OUTER JOIN (
        SELECT
          favorites.*
        FROM
          favorites
        WHERE
          favorites.user_id = ?
      ) AS b ON articles.id = b.article_id 
      WHERE
        articles.id = ?
    SQL
    Article.find_by_sql([query, user_id, article_id])[0]
  end
end

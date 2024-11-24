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
  include StringEnum

  # for pagination
  BUCKET_SIZE = 5
  SECTIONS = %i(us politics sports business).freeze

  validates :title, :body, presence: true
  validates(
    :section,
    presence: true,
    inclusion: {
      in: %w(us politics sports business),
      message: I18n.t("models.article.errors.section.inclusion"),
    },
  )
  validates :featured, inclusion: { in: [true, false] }

  belongs_to :author
  belongs_to :photo

  has_many :favorites, dependent: :destroy
  has_many :readers, through: :favorites, source: :user
  has_many :comments, dependent: :destroy

  string_enum :section, SECTIONS

  def self.user_favorites(user, after = nil)
    if after
      article = user.
        favorite_articles.
        where("articles.id < ?", after)
    else
      article = user.
        favorite_articles
    end

    article.order(id: :desc).
      limit(BUCKET_SIZE).
      includes(:author, photo: :thumbnail_blob)
  end

  def self.latest(after = nil)
    if after
      article = Article.
        where("articles.id < ?", after)
    else
      article = Article
    end

    article.order(created_at: :desc).
      limit(BUCKET_SIZE).
      includes(:author, photo: :thumbnail_blob)
  end

  def self.section(section, after = nil)
    if after
      articles = Article.
        where("articles.section = ? AND articles.id < ?", section, after)
    else
      articles = Article.
        where(section: section)
    end

    articles.order(created_at: :desc).
      limit(BUCKET_SIZE).
      includes(:author, photo: :thumbnail_blob)
  end

  def self.featured_article
    Article.
      where(featured: true).
      order(id: :desc).
      limit(1).
      eager_load(:author, :photo)
  end

  def self.trending_articles
    # "trending score" is a weighted score of total comments and user favorites
    favorites_join = <<-SQL
    LEFT OUTER JOIN
      (SELECT
        favorites.article_id as fav_art_id, COUNT(favorites.id) as fav_num
      FROM
        favorites
      GROUP BY
        favorites.article_id) AS fav ON fav.fav_art_id = articles.id
    SQL

    comments_join = <<-SQL
      LEFT OUTER JOIN
        (SELECT
          comments.article_id as com_art_id, COUNT(comments.id) as com_num
        FROM
          comments
        GROUP BY
          comments.article_id) AS com ON com.com_art_id = articles.id
    SQL

    Article.
      includes(photo: :thumbnail_blob).
      joins(favorites_join).
      joins(comments_join).
      select([
        "articles.*",
        "COALESCE(fav.fav_num * 5, 0) + COALESCE(com.com_num, 0) AS trend_val",
      ]).
      order("trend_val DESC").
      limit(6)
  end
end

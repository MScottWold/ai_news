class Article < ApplicationRecord
  include StringEnum

  # for pagination
  BUCKET_SIZE = 5
  SECTIONS = %i(us politics sports business).freeze

  validates :title, presence: true
  validates(
    :section,
    presence: true,
    inclusion: {
      in: %w(us politics sports business),
      message: I18n.t("models.article.errors.section.inclusion"),
    },
  )
  validates :featured, inclusion: { in: [true, false] }

  scope :active, -> { where(active: true) }
  scope :featured, -> { where(featured: true) }
  scope :highlighted, -> { where(highlighted: true) }

  belongs_to :author

  has_one :photo, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :readers, through: :favorites, source: :user
  has_many :comments, dependent: :destroy

  string_enum :section, SECTIONS

  delegate :image_attached?, to: :photo

  class << self
    def user_favorites(user, after = nil)
      if after
        article = user.
          favorite_articles.
          active.
          where(id: ...after)
      else
        article = user.
          favorite_articles.
          active
      end

      article.
        order(id: :desc).
        includes(:author, photo: :image_blob).
        limit(BUCKET_SIZE)
    end

    def latest(after = nil)
      scope = active.
        includes(:author, photo: :image_blob).
        order(created_at: :desc).
        limit(BUCKET_SIZE)

      after ? scope.where(id: ...after) : scope
    end

    def section(section, after = nil)
      if after
        articles = Article.
          active.
          where("articles.section = ? AND articles.id < ?", section, after)
      else
        articles = Article.
          active.
          where(section: section)
      end

      articles.
        includes(:author, photo: :image_blob).
        order(created_at: :desc).
        limit(BUCKET_SIZE)
    end

    def featured_article
      active.
        featured.
        order(id: :desc).
        limit(1).
        eager_load(:author, :photo).
        first
    end

    def trending_articles
      # "trending score" is a weighted score of total comments and user favorites
      active.
        includes(photo: :image_blob).
        joins(favorites_join_sql).
        joins(comments_join_sql).
        select([
          "articles.*",
          "COALESCE(fav.fav_num * 5, 0) + COALESCE(com.com_num, 0) AS trend_val",
        ]).
        order("trend_val DESC").
        limit(6)
    end

    def highlighted_articles
      active.
        highlighted.
        limit(10).
        eager_load(:author)
    end

    def author_articles(author_id, last_id)
      active.
        includes(photo: :image_blob).
        where(author_id: author_id).
        where(id: ...last_id).
        order(id: :desc).
        limit(5)
    end

    private

    def favorites_join_sql
      <<-SQL.squish
      LEFT OUTER JOIN
        (SELECT
          favorites.article_id as fav_art_id, COUNT(favorites.id) as fav_num
        FROM
          favorites
        GROUP BY
          favorites.article_id) AS fav ON fav.fav_art_id = articles.id
      SQL
    end

    def comments_join_sql
      <<-SQL.squish
        LEFT OUTER JOIN
          (SELECT
            comments.article_id as com_art_id, COUNT(comments.id) as com_num
          FROM
            comments
          GROUP BY
            comments.article_id) AS com ON com.com_art_id = articles.id
      SQL
    end
  end
end

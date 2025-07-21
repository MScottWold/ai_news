class Article < ApplicationRecord
  include StringEnum

  BUCKET_SIZE = 5
  SECTIONS = %i(us politics sports business).freeze

  string_enum :section, SECTIONS

  validates :title, presence: true

  scope :active, -> { where(active: true) }
  scope :featured, -> { where(featured: true) }
  scope :highlighted, -> { where(highlighted: true) }

  belongs_to :author

  has_one :photo, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :readers, through: :favorites, source: :user
  has_many :comments, dependent: :destroy

  delegate :image_attached?, to: :photo

  def user_favorite_id(user)
    favorites.where(user_id: user.id).pick(:id)
  end

  class << self
    def featured_article
      active.featured.order(id: :desc).eager_load(:author, :photo).first
    end

    def highlighted_articles
      active.
        highlighted.
        order(id: :desc).
        limit(10).
        eager_load(:author)
    end

    def trending
      # "trending score" is a weighted score of total comments and user favorites
      active.
        includes(photo: :image_blob).
        joins(favorites_join_sql).
        joins(comments_join_sql).
        select([
          "articles.*",
          "COALESCE(fav.score, 0) + COALESCE(com.score, 0) AS trend_val",
        ]).
        order("trend_val DESC, created_at DESC").
        limit(6)
    end

    def latest(before_id = nil)
      articles = active.
        includes(photo: :image_blob).
        order(created_at: :desc).
        limit(BUCKET_SIZE)

      before_id.present? ? articles.where(id: ...before_id) : articles
    end

    def from_section(section, before_id = nil)
      articles = active.
        includes(:author, photo: :image_blob).
        where(section: section).
        order(created_at: :desc).
        limit(BUCKET_SIZE)

      before_id.present? ? articles.where(id: ...before_id) : articles
    end

    def from_author(author_id, before_id = nil)
      articles = active.
        includes(photo: :image_blob).
        where(author_id: author_id).
        order(id: :desc).
        limit(BUCKET_SIZE)

      before_id.present? ? articles.where(id: ...before_id) : articles
    end

    def user_favorites(user, before_id = nil)
      favorites = user.
        favorite_articles.
        active.
        includes(:author, photo: :image_blob).
        order(id: :desc).
        limit(BUCKET_SIZE)

      before_id.present? ? favorites.where(id: ...before_id) : favorites
    end

    private

    def favorites_join_sql
      sql_string = Favorite.
        group(:article_id).
        select("favorites.article_id, COUNT(*) * 5 AS score").
        to_sql

      "LEFT OUTER JOIN (#{sql_string}) AS fav ON fav.article_id = articles.id"
    end

    def comments_join_sql
      sql_string = Comment.
        group(:article_id).
        select("comments.article_id, COUNT(*) AS score").
        to_sql

      "LEFT OUTER JOIN (#{sql_string}) AS com ON com.article_id = articles.id"
    end
  end
end

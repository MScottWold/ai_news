# frozen_string_literal: true

class ArticleQuery
  BUCKET_SIZE = 5

  class << self
    def featured
      active_articles.
        featured.
        order(id: :desc).
        eager_load(:author, :photo).
        first
    end

    def trending
      # "trending score" is a weighted score of total comments and user favorites
      active_articles.
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

    def highlighted
      active_articles.
        highlighted.
        limit(10).
        eager_load(:author)
    end

    def by_author(author_id, last_id = nil)
      article_query = active_articles.
        includes(photo: :image_blob).
        where(author_id: author_id).
        order(id: :desc).
        limit(BUCKET_SIZE)

      last_id.present? ? article_query.where(id: ...last_id) : article_query
    end

    def by_filter(filter:, after_id:, current_user:)
      case filter.to_sym
      when :archives
        [:collection, latest(after_id)]
      when :latest
        [:latest, latest]
      when :trending
        [:trending, ArticleQuery.trending]
      when *Article::SECTIONS
        [:collection, section(filter, after_id)]
      when :favorites
        [:collection, user_favorites(current_user, after_id)]
      else
        [:none, default_query.includes(photo: :image_blob)]
      end
    end

    private

    def user_favorites(user, after = nil)
      if after
        article_query = active_favorites(user).where(id: ...after)
      else
        article_query = active_favorites(user)
      end

      article_query.
        order(id: :desc).
        includes(:author, photo: :image_blob).
        limit(BUCKET_SIZE)
    end

    def latest(after = nil)
      article_query = active_articles.
        includes(photo: :image_blob).
        order(created_at: :desc).
        limit(BUCKET_SIZE)

      after ? article_query.where(id: ...after) : article_query
    end

    def section(section, after = nil)
      if after
        article_query = active_articles.
          where("articles.section = ? AND articles.id < ?", section, after)
      else
        article_query = active_articles.
          where(section: section)
      end

      article_query.
        includes(:author, photo: :image_blob).
        order(created_at: :desc).
        limit(BUCKET_SIZE)
    end

    def default_query
      active_articles.limit(BUCKET_SIZE).includes(photo: :image_blob)
    end

    def active_articles
      Article.active
    end

    def active_favorites(user)
      user.favorite_articles.active
    end

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

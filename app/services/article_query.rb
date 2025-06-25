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
          "COALESCE(fav.score, 0) + COALESCE(com.score, 0) AS trend_val",
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

    def by_filter(filter:, before_id:, current_user:)
      case filter.to_sym
      when :archives
        [:collection, latest(before_id)]
      when :latest
        [:latest, latest]
      when :trending
        [:trending, ArticleQuery.trending]
      when *Article::SECTIONS
        [:collection, section(filter, before_id)]
      when :favorites
        [:collection, user_favorites(current_user, before_id)]
      else
        [:none, default_query.includes(photo: :image_blob)]
      end
    end

    private

    def user_favorites(user, before_id = nil)
      if before_id
        article_query = active_favorites(user).where(id: ...before_id)
      else
        article_query = active_favorites(user)
      end

      article_query.
        order(id: :desc).
        includes(:author, photo: :image_blob).
        limit(BUCKET_SIZE)
    end

    def latest(before_id = nil)
      article_query = active_articles.
        includes(photo: :image_blob).
        order(created_at: :desc).
        limit(BUCKET_SIZE)

      before_id ? article_query.where(id: ...before_id) : article_query
    end

    def section(section, before_id = nil)
      if before_id
        article_query = active_articles.
          where(section: section, id: ...before_id)
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

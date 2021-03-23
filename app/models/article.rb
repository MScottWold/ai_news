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
      .includes(:author, photo: :thumbnail_blob)
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
      .includes(:author, photo: :thumbnail_blob)
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
      .includes(:author, photo: :thumbnail_blob)
  end

  def self.get_featured_article
    Article
      .where(featured: true)
      .order(id: :desc)
      .limit(1)
      .eager_load(:author, :photo)
  end

  def self.get_trending_articles
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

    Article
      .includes(photo: :thumbnail_blob)
      .joins(favorites_join)
      .joins(comments_join)
      .select([
        "articles.*",
        "COALESCE(fav.fav_num * 5, 0) + COALESCE(com.com_num, 0) AS trend_val"
      ])
      .order("trend_val DESC")
      .limit(6)
  end
end

class Article
  class CollectionFinder
    def self.filter_and_articles(collection, after_id, current_user)
      case collection
      when "archives"
        ["collection", Article.latest(after_id)]
      when "latest"
        ["latest", Article.latest]
      when "trending"
        ["trending", Article.trending_articles]
      when "us", "sports", "politics", "business"
        ["collection", Article.section(collection, after_id)]
      when "favorites"
        ["collection", Article.user_favorites(current_user, after_id)]
      else
        ["none", Article.active.limit(5).includes(photo: :image_blob)]
      end
    end
  end
end

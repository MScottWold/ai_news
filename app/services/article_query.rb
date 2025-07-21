# frozen_string_literal: true

class ArticleQuery
  class << self
    def by_filter(filter:, before_id: nil, current_user: nil)
      case filter.to_sym
      when :archives
        [:collection, Article.latest(before_id)]
      when :latest
        [:latest, Article.latest]
      when :trending
        [:trending, Article.trending]
      when *Article::SECTIONS
        [:collection, Article.from_section(filter, before_id)]
      when :favorites
        [:collection, Article.user_favorites(current_user, before_id)]
      else
        [filter, []]
      end
    end
  end
end

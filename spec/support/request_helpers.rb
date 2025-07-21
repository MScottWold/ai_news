module RequestHelpers
  def articles_index_body(filter, articles)
    articles_hash = articles.each_with_object({}) do |article, h|
      h[article.id] = article_hash(article)
    end

    {
      articles: articles_hash,
      filter: { filter => articles.map(&:id) },
    }.to_json
  end

  def image_path(photo, variant)
    URI(url_for(photo.image.variant(variant))).path
  end

  private

  def article_hash(article)
    {
      id: article.id,
      section: article.section,
      title: article.title,
      createdAt: article.created_at,
      photo: { thumbUrl: image_path(article.photo, :thumb) },
    }
  end
end

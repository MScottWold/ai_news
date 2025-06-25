# frozen_string_literal: true

class AiArticleGenerator
  PHOTO_CAPTION_REGEX = /\**Photo Caption:\**/

  def self.generate_article_body(article)
    new(article).generate_article_body
  end

  def initialize(article)
    @article = article
  end

  def generate_article_body
    body, photo_caption = generated_text.split(PHOTO_CAPTION_REGEX)

    article.update(body: body.strip)
    update_photo(photo_caption.strip)
  end

  private

  attr_reader :article

  def update_photo(photo_caption)
    photo = article.photo

    if photo.present?
      photo.update(alt_text: photo_caption)
    else
      article.create_photo!(alt_text: photo_caption)
    end
  end

  def generated_text
    article_prompt = I18n.t(
      "prompts.article",
      headline: article.title,
    )
    Google::GeminiGateway.generate_content(prompt: article_prompt)
  end
end

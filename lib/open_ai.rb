# frozen_string_literal: true

module OpenAi
  class ImageGenerationError < StandardError; end
  class ImageFetchError < StandardError; end

  IMAGE_GENERATION_URL = "https://api.openai.com/v1/images/generations"
  IMAGE_SIZE = "1024x1024"
end

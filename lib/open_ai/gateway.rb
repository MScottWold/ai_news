# frozen_string_literal: true

module OpenAi
  class Gateway
    MODELS = { dalle_3: Model::Dalle }.freeze

    def self.generate_image(prompt:, model: :dalle_3)
      image_url = MODELS[model].generate_image_url(prompt)

      ImageFetcher.get(image_url)
    end
  end
end

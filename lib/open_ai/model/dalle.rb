# frozen_string_literal: true

module OpenAi
  module Model
    class Dalle
      include ErrorHandling

      MODEL_NAME = "dall-e-3"

      def self.generate_image_url(prompt)
        new(prompt).generate_image_url
      end

      def initialize(prompt)
        @prompt = prompt
      end

      def generate_image_url
        response = connection.post do |req|
          req.url(IMAGE_GENERATION_URL)
          req.body = request_params
        end

        if response.success?
          JSON.parse(response.body)["data"].first["url"]
        else
          raise ImageGenerationError, parse_error(response)
        end
      end

      private

      attr_reader :prompt

      def request_params
        {
          prompt: prompt,
          model: MODEL_NAME,
          n: 1,
          size: IMAGE_SIZE,
          style: :natural,
        }.to_json
      end

      def request_headers
        {
          "Content-Type" => "application/json",
          "Authorization" => "Bearer #{ENV.fetch('OPEN_AI_KEY', '')}",
        }
      end

      def connection
        Faraday.new(headers: request_headers) do |conn|
          conn.adapter Faraday.default_adapter
        end
      end
    end
  end
end

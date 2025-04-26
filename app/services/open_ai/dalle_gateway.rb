# frozen_string_literal: true

module OpenAi
  class DalleGatewayError < StandardError; end

  class DalleGateway
    URL = "https://api.openai.com/v1/images/generations"
    MODEL = "dall-e-3"
    SIZE = "1024x1024"

    def self.generate_image(prompt:)
      new(prompt).generate_image
    end

    def initialize(prompt)
      @prompt = prompt
    end

    def generate_image
      image_url = generated_image_url

      fetch_image(image_url)
    end

    private

    attr_reader :prompt, :image_url

    def fetch_image(image_url)
      response = Faraday.default_connection.get(image_url)

      if response.success?
        response.body
      else
        raise DalleGatewayError, dalle_error(response)
      end
    end

    def generated_image_url
      response = connection.post do |req|
        req.url(URL)
        req.body = image_generation_params
      end

      if response.success?
        JSON.parse(response.body)["data"].first["url"]
      else
        raise DalleGatewayError, dalle_error(response)
      end
    end

    def dalle_error(response)
      JSON.parse(response.body)["error"]["message"]
    end

    def image_generation_params
      {
        prompt: prompt,
        model: MODEL,
        n: 1,
        size: SIZE,
        style: :natural,
      }.to_json
    end

    def connection
      Faraday.new(headers: faraday_headers) do |conn|
        conn.adapter Faraday.default_adapter
      end
    end

    def faraday_headers
      {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{ENV.fetch('OPEN_AI_KEY', '')}",
      }
    end
  end
end

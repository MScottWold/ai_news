# frozen_string_literal: true

module Google
  class GeminiGatewayError < StandardError; end

  class GeminiGateway
    URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=%s"

    class << self
      def generate_content(prompt:)
        response = post(prompt)

        if response.success?
          generated_text(JSON.parse(response.body))
        else
          raise GeminiGatewayError, error_message(JSON.parse(response.body))
        end
      end

      def error_message(body)
        body.deep_symbolize_keys.dig(:error, :message)
      end

      def generated_text(body)
        body.
          deep_symbolize_keys.
          dig(:candidates, 0, :content, :parts, 0, :text)
      end

      def post(prompt)
        Faraday.default_connection.post(
          URL % ENV.fetch("GOOGLE_AI_STUDIO_API_KEY"),
          {
            contents: [{
              parts: [{ text: prompt }],
            }],
          }.to_json,
          { "Content-Type" => "application/json" },
        )
      end
    end
  end
end

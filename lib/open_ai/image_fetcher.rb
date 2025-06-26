module OpenAi
  class ImageFetcher
    extend ErrorHandling

    class << self
      def get(image_url)
        response = Faraday.default_connection.get(image_url)

        if response.success?
          response.body
        else
          raise ImageFetchError, parse_error(response)
        end
      end
    end
  end
end

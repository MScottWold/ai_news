module OpenAi
  module ErrorHandling
    def parse_error(response)
      JSON.parse(response.body)["error"]["message"]
    end
  end
end

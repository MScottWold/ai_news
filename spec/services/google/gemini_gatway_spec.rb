require "rails_helper"

RSpec.describe Google::GeminiGateway do
  let(:faraday_connection) { double }
  let(:prompt) { "some prompt" }
  let(:faraday_response) { double(body: response_body, success?: success) }
  let(:request_body) do
    {
      contents: [{
        parts: [{ text: prompt }],
      }],
    }.to_json
  end

  before do
    allow(Faraday).to receive(:default_connection).
      and_return(faraday_connection)
    allow(faraday_connection).to receive(:post).
      with(
        Google::GeminiGateway::URL % "123",
        request_body,
        { "Content-Type" => "application/json" },
      ).and_return(faraday_response)
    allow(ENV).to receive(:fetch).with("GOOGLE_AI_STUDIO_API_KEY").
      and_return("123")
  end

  describe "::generate_content" do
    context "when the response is successful" do
      let(:success) { true }
      let(:response_body) do
        {
          candidates: [{
            content: {
              parts: [{
                text: "AI content",
              }],
            },
          }],
        }.to_json
      end

      it "returns the generated text" do
        generated_text = described_class.generate_content(prompt: prompt)

        expect(generated_text).to eq("AI content")
      end
    end

    context "when the response is NOT successful" do
      let(:success) { false }
      let(:response_body) { { error: { message: "some error"} }.to_json }

      it "raises an error" do
        expect { described_class.generate_content(prompt: prompt) }.
          to raise_error(Google::GeminiGatewayError, "some error")
      end
    end
  end
end

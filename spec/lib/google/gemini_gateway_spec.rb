require "rails_helper"

RSpec.describe Google::GeminiGateway do
  let(:prompt) { Faker::Lorem.sentence }
  let(:text_output) { Faker::Lorem.sentence }
  let(:key) { Faker::Alphanumeric.alpha }

  around do |example|
    use_env_variables("GOOGLE_AI_STUDIO_API_KEY" => key) { example.run }
  end

  before do
    stub_request(:post, Google::GeminiGateway::URL % key).
      with(
        body: { contents: [{ parts: [{ text: prompt }] }] }.to_json,
        headers: { "Content-Type" => "application/json" },
      ).to_return(body: response_body.to_json, status: response_status)
  end

  describe "::generate_content" do
    context "when the response is successful" do
      let(:response_body) do
        { candidates: [{ content: { parts: [{ text: text_output }] } }] }
      end
      let(:response_status) { 200 }

      it "returns the generated text" do
        expect(described_class.generate_content(prompt: prompt)).
          to eq(text_output)
      end
    end

    context "when the response is NOT successful" do
      let(:error_message) { "error messsage" }
      let(:response_body) { { error: { message: error_message } } }
      let(:response_status) { 400 }

      it "raises an error" do
        expect { described_class.generate_content(prompt: prompt) }.
          to raise_error(Google::GeminiGatewayError, error_message)
      end
    end
  end
end

require "rails_helper"

RSpec.describe OpenAi::Model::Dalle do
  let(:prompt) { Faker::Lorem.sentence }
  let(:image_url) { Faker::Internet.url }
  let(:key) { Faker::Alphanumeric.alpha }

  around do |example|
    use_env_variables("OPEN_AI_KEY" => key) { example.run }
  end

  before do
    stub_request(:post, OpenAi::IMAGE_GENERATION_URL).
      with(
        body: {
          prompt: prompt,
          model: OpenAi::Model::Dalle::MODEL_NAME,
          n: 1,
          size: OpenAi::IMAGE_SIZE,
          style: :natural,
        }.to_json,
        headers: {
          "Content-Type" => "application/json",
          "Authorization" => "Bearer #{key}",
        },
      ).
      to_return(body: response_body.to_json, status: response_status)
  end

  describe "::generate_image_url" do
    context "the response is successful" do
      let(:response_body) { { data: [{ url: image_url }] } }
      let(:response_status) { 200 }

      it "configures the Faraday connection and makes a post request" do
        expect(described_class.generate_image_url(prompt)).
          to eq(image_url)
      end
    end

    context "the response is NOT successful" do
      let(:error_message) { "error_message" }
      let(:response_body) { { error: { message: error_message } } }
      let(:response_status) { 422 }

      it "configures the Faraday connection and makes a post request" do
        expect { described_class.generate_image_url(prompt) }.
          to raise_error(OpenAi::ImageGenerationError, error_message)
      end
    end
  end
end

require "rails_helper"

RSpec.describe OpenAi::ImageFetcher do
  let(:image_url) { Faker::Internet.url }
  let(:image_string) { Faker::Alphanumeric.alpha }

  before do
    stub_request(:get, image_url).
      to_return(body: response_body, status: response_status)
  end

  describe "::get" do
    context "makes a request for the image" do
      let(:response_body) { image_string }
      let(:response_status) { 200 }

      it "returns the image string" do
        expect(described_class.get(image_url)).
          to eq(image_string)
      end

      context "the request is NOT successful" do
        let(:error_message) { "error_message" }
        let(:response_body) { { error: { message: error_message } }.to_json }
        let(:response_status) { 401 }

        it "raises an ImageFetchError error" do
          expect { described_class.get(image_url) }.
            to raise_error(OpenAi::ImageFetchError, error_message)
        end
      end
    end
  end
end

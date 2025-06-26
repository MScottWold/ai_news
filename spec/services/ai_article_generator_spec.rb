require "rails_helper"

RSpec.describe AiArticleGenerator do
  let(:article_body) { Faker::Lorem.sentence }
  let(:photo_caption) { Faker::Lorem.sentence }
  let(:article) { create(:article, body: nil) }

  before do
    allow(Google::GeminiGateway).to receive(:generate_content).
      with(prompt: I18n.t("prompts.article", headline: article.title)).
      and_return("#{article_body} **Photo Caption:** #{photo_caption}")
  end

  describe "::generate_article_body" do
    context "the article does NOT have a photo" do
      it "updates the article body and creates a photo" do
        expect(article.photo).to be_nil
        described_class.generate_article_body(article)

        expect(article.body).to eq(article_body)
        expect(article.photo.alt_text).to eq(photo_caption)
      end
    end

    context "the article has a photo" do
      let!(:photo) { create(:photo, article: article, alt_text: nil) }

      it "updates the photo and article" do
        described_class.generate_article_body(article)

        expect(article.body).to eq(article_body)
        expect(article.photo.alt_text).to eq(photo_caption)
      end
    end
  end
end

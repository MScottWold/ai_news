require "rails_helper"

RSpec.describe "/authors", type: :request do
  describe "GET /authors/:id" do
    context "when the author is NOT present" do
      it "returns 404" do
        get "/api/authors/1"

        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response).to have_http_status(:not_found)
        expect(response.body).
          to eq({ error: I18n.t("api.authors.errors.not_found") }.to_json)
      end
    end

    context "when the author IS present" do
      let(:author) { create(:author) }
      let!(:article) { create(:article, :with_image, author: author) }

      it "returns the author and article list" do
        get("/api/authors/#{author.id}")

        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response).to have_http_status(:ok)
        expect(response.body).to eq({
          articles: {
            article.id => {
              id: article.id,
              section: article.section,
              title: article.title,
              createdAt: article.created_at,
              photo: {
                thumbUrl: image_path(article.photo, :thumb),
              },
            },
          },
          articleIds: [article.id],
          author: {
            author.id => {
              id: author.id,
              name: author.name,
              bio: author.bio,
              education: author.education,
              articleIds: [article.id],
            },
          },
        }.to_json)
      end
    end
  end
end

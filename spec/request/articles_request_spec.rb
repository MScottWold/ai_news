require "rails_helper"

RSpec.describe "/articles", type: :request do
  describe "GET /articles" do
    context "without a collection" do
      it "return an error message" do
        get "/api/articles"

        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response).to have_http_status(:bad_request)
        expect(response.body).to eq({ error: "missing param: filter" }.to_json)
      end
    end

    context "when providing a filter" do
      let(:author) { create(:author) }

      context "the filter is not defined" do
        it "returns an empty list" do
          get "/api/articles", params: { filter: :undefined_filter }

          expect(response.content_type).to eq("application/json; charset=utf-8")
          expect(response).to have_http_status(:ok)
          expect(response.body).
            to eq({ articles: {}, filter: { undefined_filter: [] } }.to_json)
        end
      end

      context "the filter is archives" do
        context "without a before ID" do
          let!(:articles) do
            create_list(:article, 6, :with_image, author: author)
          end

          it "returns #{Article::BUCKET_SIZE} articles from any section" do
            get "/api/articles", params: { filter: :archives }

            expect(response.content_type).
              to eq("application/json; charset=utf-8")
            expect(response).to have_http_status(:ok)
            expect(response.body).
              to eq(articles_index_body(:collection, articles.reverse[0..4]))
          end
        end

        context "with a before ID" do
          let!(:articles) do
            create_list(:article, 2, :with_image, author: author)
          end

          it "returns articles older than provided ID" do
            get(
              "/api/articles",
              params: { filter: :archives, before: articles.second.id },
            )

            expect(response.content_type).
              to eq("application/json; charset=utf-8")
            expect(response).to have_http_status(:ok)
            expect(response.body).
              to eq(articles_index_body(:collection, [articles.first]))
          end
        end
      end

      context "the filter is latest" do
        let!(:articles) do
          create_list(:article, 6, :with_image, author: author)
        end

        it "returns #{Article::BUCKET_SIZE} of the latest articles" do
          get "/api/articles", params: { filter: :archives }

          expect(response.content_type).to eq("application/json; charset=utf-8")
          expect(response).to have_http_status(:ok)
          expect(response.body).
            to eq(articles_index_body(:collection, articles.reverse[0..4]))
        end
      end

      context "the filter is trending" do
        let(:user) { create(:user) }
        let(:author) { create(:author) }
        let!(:favorited_article) do
          create(
            :article,
            :with_image,
            :favorited,
            favorited_by: user,
            author: author,
          )
        end
        let!(:commented_article) do
          create(
            :article,
            :with_image,
            :commented,
            commented_by: user,
            author: author,
          )
        end
        let!(:articles) do
          create_list(:article, 5, :with_image, author: author)
        end

        it "returns 6 sorted trending articles" do
          get "/api/articles", params: { filter: :trending }

          expect(response.content_type).to eq("application/json; charset=utf-8")
          expect(response).to have_http_status(:ok)

          expected_result = articles_index_body(
            :trending,
            [
              favorited_article,
              commented_article,
              *articles.reverse[0..3],
            ],
          )

          expect(response.body).to eq(expected_result)
        end
      end

      context "when filtering by section" do
        Article::SECTIONS.each do |section|
          let(:author) { create(:author) }

          context "articles of another section exist" do
            before do
              other_section = Article::SECTIONS.reject { _1 == section }.sample
              create(
                :article,
                :with_image,
                section: other_section,
                author: author,
              )
            end

            context "the filter is #{section}" do
              context "without a before ID" do
                let!(:articles) do
                  create_list(
                    :article,
                    6,
                    :with_image,
                    section: section,
                    author: author,
                  )
                end

                it "returns #{Article::BUCKET_SIZE} #{section} articles" do
                  get "/api/articles", params: { filter: section }

                  expect(response.content_type).
                    to eq("application/json; charset=utf-8")
                  expect(response).to have_http_status(:ok)
                  expect(response.body).to eq(
                    articles_index_body(:collection, articles.reverse[0..4]),
                  )
                end
              end

              context "with a before ID" do
                let!(:articles) do
                  create_list(
                    :article,
                    2,
                    :with_image,
                    section: section,
                    author: author,
                  )
                end

                it "returns articles older than provided ID" do
                  get(
                    "/api/articles",
                    params: { filter: section, before: articles.second.id },
                  )

                  expect(response.content_type).
                    to eq("application/json; charset=utf-8")
                  expect(response).to have_http_status(:ok)
                  expect(response.body).
                    to eq(articles_index_body(:collection, [articles.first]))
                end
              end
            end
          end
        end
      end

      context "when filtering by favorites" do
        context "when the user IS logged in" do
          let(:user_password) do
            Faker::Internet.password(
              min_length: 8,
              max_length: 9,
              mix_case: true,
              special_characters: true,
            )
          end
          let(:user) { create(:user, :with_password, password: user_password) }
          let(:author) { create(:author) }

          before do
            post "/api/session", params: {
              user: { username: user.username, password: user_password },
            }
            create(:article, :with_image, author: author)
          end

          context "without a before ID" do
            let!(:articles) do
              create_list(
                :article,
                6,
                :with_image,
                :favorited,
                favorited_by: user,
                author: author,
              )
            end

            it "returns the first #{Article::BUCKET_SIZE} users favorites" do
              get "/api/articles", params: { filter: :favorites }

              expect(response.content_type).
                to eq("application/json; charset=utf-8")
              expect(response).to have_http_status(:ok)
              expect(response.body).
                to eq(articles_index_body(:collection, articles.reverse[0..4]))
            end
          end

          context "with a before ID" do
            let!(:articles) do
              create_list(
                :article,
                2,
                :with_image,
                :favorited,
                favorited_by: user,
                author: author,
              )
            end

            it "returns articles older than provided ID" do
              get "/api/articles", params: {
                filter: :favorites,
                before: articles.second.id,
              }

              expect(response.content_type).
                to eq("application/json; charset=utf-8")
              expect(response).to have_http_status(:ok)
              expect(response.body).
                to eq(articles_index_body(:collection, [articles.first]))
            end
          end
        end

        context "when the user is NOT logged in" do
          it "returns an error" do
            get "/api/articles", params: { filter: :favorites }

            expect(response.content_type).
              to eq("application/json; charset=utf-8")
            expect(response).to have_http_status(:unauthorized)
            expect(response.body).
              to eq({ error: "must be logged in" }.to_json)
          end
        end
      end
    end
  end

  describe "GET articles/front_page" do
    let(:author) { create(:author) }
    let!(:featured_article) do
      create(:article, :with_image, featured: true, author: author)
    end
    let!(:highlighted_article) do
      create(:article, :with_image, highlighted: true, author: author)
    end

    it "returns the front page articles" do
      get "/api/articles/front_page"

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:ok)
      expect(response.body).
        to eq({
          featured: {
            id: featured_article.id,
            section: featured_article.section,
            title: featured_article.title,
            photo: {
              id: featured_article.photo.id,
              imageUrl: image_path(featured_article.photo, :large),
              altText: featured_article.photo.alt_text,
            },
            authorName: author.name,
            createdAt: featured_article.created_at,
          },
          highlighted: [
            {
              id: highlighted_article.id,
              title: highlighted_article.title,
              authorName: author.name,
            },
            {
              id: featured_article.id,
              title: featured_article.title,
              authorName: author.name,
            },
          ],
        }.to_json)
    end
  end

  describe "GET articles/author_articles/:author_id" do
    let(:author) { create(:author) }
    let!(:articles) { create_list(:article, 2, :with_image, author: author) }

    it "returns articles from an author" do
      get "/api/authors/#{author.id}/articles", params: {
        before: articles.last.id,
      }

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:ok)

      first_article = articles.first

      expect(response.body).
        to eq({
          articles: {
            first_article.id => {
              id: first_article.id,
              section: first_article.section,
              title: first_article.title,
              createdAt: first_article.created_at,
              photo: {
                thumbUrl: image_path(first_article.photo, :thumb),
              },
            },
          },
          articleIds: [first_article.id],
          authorId: author.id.to_s,
        }.to_json)
    end

    context "without a before ID" do
      it "returns an error" do
        get "/api/authors/#{author.id}/articles"

        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response).to have_http_status(:bad_request)
        expect(response.body).
          to eq({ error: I18n.t("api.articles.errors.before_missing") }.to_json)
      end
    end
  end

  describe "GET articles/:article_id" do
    context "when the article is NOT found" do
      it "returns not found" do
        get "/api/articles/1"

        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response).to have_http_status(:not_found)
        expect(response.body).
          to eq({ message: I18n.t("api.articles.errors.not_found") }.to_json)
      end
    end

    context "when the article is found" do
      let!(:article) { create(:article, :with_image) }
      let(:photo) { article.photo }

      it "returns the article details" do
        get "/api/articles/#{article.id}"

        expect(response.content_type).to eq("application/json; charset=utf-8")
        expect(response).to have_http_status(:ok)
        expect(response.body).to eq({
          article.id => {
            id: article.id,
            section: article.section,
            title: article.title,
            createdAt: article.created_at,
            body: article.body,
            authorName: article.author.name,
            authorId: article.author.id,
            photo: {
              id: photo.id,
              imageUrl: image_path(photo, :large),
              altText: photo.alt_text,
              thumbUrl: image_path(photo, :thumb),
            },
          },
        }.to_json)
      end
    end
  end
end

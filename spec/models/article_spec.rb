require "rails_helper"

RSpec.describe Article do
  describe "associations" do
    it { should have_many(:favorites) }
    it { should have_many(:readers) }
    it { should have_many(:comments) }
    it { should have_one(:photo) }
    it { should belong_to(:author) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
  end

  describe "enums" do
    it do
      should define_enum_for(:section).
        backed_by_column_of_type(:string).
        with_values(described_class::SECTIONS.index_with(&:to_s))
    end
  end

  describe "scopes" do
    %w(active featured highlighted).each do |scope|
      describe "::#{scope}" do
        it "has the correct query" do
          expect(described_class.send(scope).where_values_hash).
            to eq({ scope => true })
        end
      end
    end
  end

  describe "#user_favorite_id" do
    let(:user) { create(:user) }
    let!(:article) { create(:article, :favorited, favorited_by: user) }
    let(:user_favorite) { article.favorites.first }

    it "returns the favorite ID for a user favorite" do
      expect(article.user_favorite_id(user)).to eq(user_favorite.id)
    end
  end

  describe "::featured_article" do
    let(:author) { create(:author) }
    let!(:featured) { create_list(:article, 2, featured: true, author: author) }

    it "returns the latest featured article" do
      expect(described_class.featured_article).to eq(featured.last)
    end
  end

  describe "::highlighted_articles" do
    let(:author) { create(:author) }
    let!(:articles) do
      create_list(:article, 11, highlighted: true, author: author)
    end

    it "returns 10 highlighted articles" do
      expect(described_class.highlighted_articles).
        to eq(articles[1..10].reverse)
    end
  end

  describe "::trending" do
    let(:user) { create(:user) }
    let(:author) { create(:author) }
    let!(:favorited_article) do
      create(
        :article,
        :favorited,
        favorited_by: user,
        author: author,
      )
    end
    let!(:commented_article) do
      create(
        :article,
        :commented,
        commented_by: user,
        author: author,
      )
    end
    let!(:articles) do
      create_list(:article, 5, :with_image, author: author)
    end

    it "returns #{described_class::BUCKET_SIZE} articles ordered by trending value" do
      expect(described_class.trending).to eq([
        favorited_article,
        commented_article,
        *articles.reverse[0..3],
      ])
    end
  end

  describe "::latest" do
    let(:author) { create(:author) }
    let!(:articles) { create_list(:article, 7, author: author) }

    context "WITH before_id" do
      it "returns #{described_class::BUCKET_SIZE} articles prior to the ID" do
        expect(described_class.latest(articles[6].id)).
          to eq(articles[1..5].reverse)
      end
    end

    context "WITHOUT before_id" do
      it "returns the latest #{described_class::BUCKET_SIZE} articles" do
        expect(described_class.latest).to eq(articles[2..7].reverse)
      end
    end
  end

  describe "::from_section" do
    let(:author) { create(:author) }
    let(:section) { "sports" }
    let!(:articles) do
      create_list(:article, 7, section: section, author: author)
    end

    before { create(:article, section: :us, author: author) }

    context "WITH a before_id" do
      it "returns #{described_class::BUCKET_SIZE} articles prior to the ID" do
        expect(described_class.from_section(section, articles[6].id)).
          to eq(articles[1..5].reverse)
      end
    end

    context "WITHOUT a before_id" do
      it "returns the latest #{described_class::BUCKET_SIZE} articles" do
        expect(described_class.from_section(section)).
          to eq(articles[2..7].reverse)
      end
    end
  end

  describe "::from_author" do
    let(:author) { create(:author) }
    let!(:articles) do
      create_list(:article, 7, author: author)
    end

    context "WITH a before_id" do
      it "returns #{described_class::BUCKET_SIZE} articles prior to the ID" do
        expect(described_class.from_author(author.id, articles[6].id)).
          to eq(articles[1..5].reverse)
      end
    end

    context "WITHOUT a before_id" do
      it "returns the latest #{described_class::BUCKET_SIZE} articles" do
        expect(described_class.from_author(author.id)).
          to eq(articles[2..7].reverse)
      end
    end
  end

  describe "::user_favorites" do
    let(:user) { create(:user) }
    let(:author) { create(:author) }
    let!(:articles) do
      create_list(
        :article,
        7,
        :favorited,
        favorited_by: user,
        author: author,
      )
    end

    before do
      create(:article, author: author)
    end

    context "WITH a before_id" do
      it "returns #{described_class::BUCKET_SIZE} articles prior to the ID" do
        expect(described_class.user_favorites(user, articles[6].id)).
          to eq(articles[1..5].reverse)
      end
    end

    context "WITHOUT a before_id" do
      it "returns the latest #{described_class::BUCKET_SIZE} articles" do
        expect(described_class.user_favorites(user)).
          to eq(articles[2..7].reverse)
      end
    end
  end
end

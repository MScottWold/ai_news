require "rails_helper"

RSpec.describe ArticleQuery do
  let(:articles) { double(:articles) }
  let(:before_id) { double(:before_id) }
  let(:current_user) { double(:current_user) }

  before do
    allow(Article).to receive(:latest).and_return(articles)
    allow(Article).to receive(:trending).and_return(articles)
    allow(Article).to receive(:from_section).and_return(articles)
    allow(Article).to receive(:user_favorites).and_return(articles)
  end

  describe "::by_filter" do
    context "when filter is archives" do
      it "returns the filter and articles" do
        result = described_class.
          by_filter(filter: :archives, before_id: before_id)

        expect(Article).to have_received(:latest).with(before_id)
        expect(result).to eq([:collection, articles])
      end
    end

    context "when filter is latest" do
      it "returns the filter and articles" do
        result = described_class.
          by_filter(filter: :latest)

        expect(Article).to have_received(:latest)
        expect(result).to eq([:latest, articles])
      end
    end

    context "when filter is trending" do
      it "returns the filter and articles" do
        result = described_class.by_filter(filter: :trending)

        expect(Article).to have_received(:trending)
        expect(result).to eq([:trending, articles])
      end
    end

    Article::SECTIONS.each do |section|
      context "when filter is #{section}" do
        context "when there is a before_id" do
          it "returns the filter and articles" do
            result = described_class.
              by_filter(filter: section, before_id: before_id)

            expect(Article).to have_received(:from_section).
              with(section, before_id)
            expect(result).to eq([:collection, articles])
          end
        end

        context "when there is NOT a before_id" do
          it "returns the filter and articles" do
            result = described_class.by_filter(filter: section)

            expect(Article).to have_received(:from_section).with(section, nil)
            expect(result).to eq([:collection, articles])
          end
        end
      end
    end

    context "when filter is favorites" do
      context "when there is a before_id" do
        it "returns the filter and articles" do
          result = described_class.
            by_filter(
              filter: :favorites,
              before_id: before_id,
              current_user: current_user,
            )

          expect(Article).to have_received(:user_favorites).
            with(current_user, before_id)
          expect(result).to eq([:collection, articles])
        end
      end

      context "when there is NOT a before_id" do
        it "returns the filter and articles" do
          result = described_class.
            by_filter(filter: :favorites, current_user: current_user)

          expect(Article).to have_received(:user_favorites).
            with(current_user, nil)
          expect(result).to eq([:collection, articles])
        end
      end
    end

    context "when there is no filter" do
      it "returns an empty list of articles" do
        result = described_class.by_filter(filter: :some_filter)

        expect(result).to eq([:some_filter, []])
      end
    end
  end
end

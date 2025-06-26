require "rails_helper"

RSpec.describe Comment do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:article) }
  end

  describe "validations" do
    it { should validate_presence_of(:body) }
  end

  describe "::for_article" do
    let(:user) { create(:user) }
    let(:article) { create(:article) }
    let!(:comments) { create_list(:comment, 11, user: user, article: article) }

    it "returns the latest 10 comments" do
      result = described_class.for_article(
        article_id: article.id,
        after_id: nil,
        before_id: nil,
      )

      expect(result).to eq(comments[1..].reverse)
    end

    context "when there is an after id" do
      it "returns articles with an ID GREATER THAN the passed ID" do
        result = described_class.for_article(
          article_id: article.id,
          after_id: comments[-2].id,
          before_id: nil,
        )

        expect(result).to eq([comments.last])
      end
    end

    context "when there is a before id" do
      it "returns articles with an ID LESS THAN the passed ID" do
        result = described_class.for_article(
          article_id: article.id,
          after_id: nil,
          before_id: comments.second.id,
        )

        expect(result).to eq([comments.first])
      end
    end
  end
end

import React from 'react';
import FeaturedArticle from './featured_article';
import HighlightedArticles from './highlighted_articles';

class FrontPage extends React.Component {
  componentDidMount() {
    const { highlightedArticles } = this.props;

    if (highlightedArticles.length === 0) {
      this.props.getFrontPage();
    }
  }

  render() {
    const { featuredArticle, highlightedArticles } = this.props;

    if (highlightedArticles.length === 0) {
      return (
        <section id="front-page">
          <h2 className="section-title">Featured</h2>
          <div className="loading-spinner"></div>
        </section>
      );
    }

    return (
      <section id="front-page">
        <h2 className="section-title">Featured</h2>
        <FeaturedArticle article={featuredArticle} />
        <HighlightedArticles articles={highlightedArticles} />
      </section>
    );
  }
}

export default FrontPage;
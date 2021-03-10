import React from 'react';
import ArticleList from './article_list';

class LatestArticles extends React.Component {
  componentDidMount() {
    if (this.props.articles.length === 0) {
      this.props.getLatestArticles();
    }
  }

  render() {
    const { articles } = this.props;

    return articles.length === 0 ? (
      <aside className="latest-articles">
        <h2>Latest</h2>
        <div className="loading-spinner"></div>
      </aside>
    ) : (
      <aside className="latest-articles">
        <h2>Latest</h2>
        <ArticleList articles={articles} />
        <a href="#/archives">See more...</a>
      </aside>
    );
  }
};

export default LatestArticles;
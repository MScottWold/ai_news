import React from 'react';
import LatestArticleItem from './latest_article_item';

class LatestArticles extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    if (this.props.articles.length === 0) {
      this.props.getLatestArticles();
    }
  }

  render() {
    const { articles } = this.props;

    const latestArticles = articles.map(article => (
      <LatestArticleItem 
        key={article.id}
        id={article.id}
        section={article. section}
        title={article.title}
        photo={article.photo} />
    ));

    return (
      <aside className="latest-articles">
        <h2>Latest</h2>
        {latestArticles}
      </aside>
    );
  }
};

export default LatestArticles;
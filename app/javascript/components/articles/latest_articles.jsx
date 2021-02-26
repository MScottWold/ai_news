import React from 'react';
import ArticleListItem from './article_list_item';

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
      <ArticleListItem 
        key={article.id}
        id={article.id}
        section={article.section}
        title={article.title}
        photo={article.photo} />
    ));

    return (
      <aside className="latest-articles">
        <h2>Latest</h2>
        {latestArticles}
        <a href="#/archives">See more...</a>
      </aside>
    );
  }
};

export default LatestArticles;
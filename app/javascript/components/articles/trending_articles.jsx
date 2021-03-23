import React from 'react';

class TrendingArticles extends React.Component {
  componentDidMount() {
    this.props.getTrendingArticles();
  }

  render() {
    const { articles } = this.props;

    if (articles.length === 0) {
      return (
        <aside id="trending-articles">
          <h2 className="section-title">Popular</h2>
          <div className="loading-spinner"></div>
        </aside>
      );
    }

    const trendingArticles = articles.map(article => {
      return (
        <li className="trending-item" key={article.id}>
          <a href={`#/articles/${article.id}`}>
            <img 
              className="trend-art-photo"
              src={article.photo.thumbnailUrl} 
              alt={article.photo.altText}/>
          </a>
          <a className="list-headline" href={`#/articles/${article.id}`}>
            {article.title}
          </a>
        </li>
      );
    })

    return (
      <aside id="trending-articles">
        <h2 className="section-title">Popular</h2>
        <ul>
          {trendingArticles}
        </ul>
      </aside>
    );
  }
}

export default TrendingArticles;
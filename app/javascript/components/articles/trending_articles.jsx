import React from 'react';

class TrendingArticles extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.getTrendingArticles();
  }

  render() {
    const { articles } = this.props;


    const trendingArticles = articles.map(article => {
      return (
        <div key={article.id}>
          <img 
            className="trend-art-photo"
            src={article.photo.photoUrl} 
            alt={article.photo.altText}/>
          <a className="list-headline" href={`#/articles/${article.id}`}>{article.title}</a>
        </div>
      );
    })

    return (
      <aside className="trending-articles">
        <h2>Trending</h2>
        {trendingArticles}
      </aside>
    );
  }
}

export default TrendingArticles;
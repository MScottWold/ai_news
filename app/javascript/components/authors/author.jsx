import React from 'react';
import ArticleFeed from '../articles/article_feed';

class Author extends React.Component {
  componentDidMount() {
    window.scrollTo(0, 0);
  }

  render() {
    const { 
      author, 
      articles, 
      articleIds,
      getAuthor,
      getMoreArticles 
    } = this.props;

    if (!author) {
      return (
        <section>
          <h2>Author Page</h2>
          <p>Loading...</p>
        </section>
      )
    }

    return (
      <section>
        <h2>{author.name}</h2>
        <p>Education: {author.education}</p>
        <p>Bio: {author.bio}</p>
        <h2>Articles from {author.name}</h2>
        <ArticleFeed
          getInitialArticles={getAuthor}
          getMoreArticles={getMoreArticles}
          articleIds={articleIds}
          articles={articles} />
      </section>
    );
  }
}

export default Author;
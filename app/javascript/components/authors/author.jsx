import React from 'react';
import ArticleFeed from '../articles/article_feed';

class Author extends React.Component {
  componentDidMount() {
    window.scrollTo(0, 0);
    document.title = "Journalists";
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
        <section className="article-section">
          <h2 className="section-title">Author Page</h2>
          <div className="loading-spinner"></div>
        </section>
      )
    }

    return (
      <section className="article-section">
        <h2 className="section-title">{author.name}</h2>
        <div id="author-bio">
          <p>Education: {author.education}</p>
          <p>Bio: {author.bio}</p>
        </div>
        <h3 className="subsection-title">Articles from {author.name}</h3>
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
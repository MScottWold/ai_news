import React from 'react';
import ArticlePhoto from '../photos/article_photo';

class FeaturedArticle extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const article = this.props.article[0];

    if (!article || !article.body) {
      this.props.getFeaturedArticle();
      return (<article><p>Loading...</p></article>);
    }

    const { photo, title, authorName, section, body, createdAt} = article;

    const publishDate = new Date(createdAt).toDateString();

    const paragraphs = body
      .split('\r\n\r\n')
      .map((para, idx) => <p key={idx}>{para}</p>);

    return (
      <article>
        <h2>Featured</h2>
        <ArticlePhoto photo={photo} />
        <div className={`${section}-tag`}>{section}</div>
        <h1 className="article-headline">{title}</h1>
        <div className="byline">
          by {authorName}; {publishDate}
        </div>
        {paragraphs}
      </article>      
    );
  }
}

export default FeaturedArticle;
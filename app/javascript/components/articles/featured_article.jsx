import React from 'react';
import ArticlePhoto from '../photos/article_photo';
import { sectionNames } from '../../util/ui_util';

class FeaturedArticle extends React.Component {
  componentDidMount() {
    const { article } = this.props;
    
    if (!article || !article.body) {
      this.props.getFeaturedArticle();
    }
  }

  render() {
    const article = this.props.article[0];

    if (!article || !article.body) {
      return (
        <article>
          <h2>Featured</h2>
          <div className="loading-spinner"></div>
        </article>
      );
    }

    const { 
      photo, 
      title, 
      authorId,
      authorName, 
      section, 
      body, 
      createdAt
    } = article;

    const publishDate = new Date(createdAt).toUTCString();

    const paragraphs = body
      .split('\r\n\r\n')
      .map((para, idx) => <p key={idx}>{para}</p>);

    return (
      <article>
        <h2>Featured</h2>
        <ArticlePhoto photo={photo} />
        <div className={`${section}-tag`}>{sectionNames[section]}</div>
        <h1 className="article-headline">{title}</h1>
        <div className="byline">
          <div>By <a href={`#/authors/${authorId}`} className="author-name">{authorName}</a></div>
          <div>{publishDate}</div>
        </div>
        {paragraphs}
      </article>      
    );
  }
}

export default FeaturedArticle;
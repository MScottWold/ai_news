import React from 'react';
import ArticlePhoto from '../photos/article_photo';
import { sectionNames } from '../../util/ui_util';

const FeaturedArticle = ({ article }) => {
  const { id, photo, title, authorName, section, createdAt } = article;

  return (
    <div id="featured-article">
      <ArticlePhoto photo={photo} />
      <div className={`${section}-tag`}>{sectionNames[section]}</div>
      <a href={`#/articles/${id}`} className="article-headline">{title}</a>
      <div className="byline">
        <div>By <span className="author-name">{authorName}</span></div>
        <div>{new Date(createdAt).toUTCString()}</div>
      </div>
    </div>      
  );
}

export default FeaturedArticle;
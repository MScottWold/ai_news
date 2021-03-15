import React from 'react';
import { sectionNames } from '../../util/ui_util';

const ArticleList = ({ articles }) => {
  const articleItems = articles.map(article => {
    const { photo, section, title, id, createdAt } = article;

    return (
      <li key={id} className="article-list-item">
        <img
          className="small-photo"
          src={photo.photoUrl}
          alt={photo.altText} />
        <ul>
          <li className={`${section}-tag`}>
            {sectionNames[section]}
          </li>
          <li>
            <a className="list-headline" href={`#/articles/${id}`}>{title}</a>
          </li>
          <li className="headline-info">
            {new Date(createdAt).toDateString().slice(4)}
          </li>
        </ul>
      </li>
    );
  });

  return (
    <ul>
      {articleItems}
    </ul>
  )
};

export default ArticleList;
import React from 'react';

const HighlightedArticles = ({ articles }) => (
  <div id="highlighted-articles">
    {articles.map(article => (
      <div className="highlighted-article" key={article.id}>
        <a className="highlighted-headline" href={`#/articles/${article.id}`}>
          {article.title}
        </a>
        <div className="headline-info">By: {article.authorName}</div>
      </div>
    ))}
  </div>
);

export default HighlightedArticles;
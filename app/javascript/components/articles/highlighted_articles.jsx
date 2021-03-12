import React from 'react';

const HighlightedArticles = ({ articles }) => (
  <div id="highlighted-articles">
    {articles.map(article => (
      <div className="highlighted-article" key={article.id}>
        <a href={`#/articles/${article.id}`}>{article.title}</a>
        <p>By: {article.authorName}</p>
      </div>
    ))}
  </div>
);

export default HighlightedArticles;
import React from 'react';
import { Link } from "react-router-dom";

const HighlightedArticles = ({ articles }) => (
  <div id="highlighted-articles">
    {articles.map(article => (
      <div className="highlighted-article" key={article.id}>
        <Link className="highlighted-headline" to={`/articles/${article.id}`}>
          {article.title}
        </Link>
        <div className="headline-info">By: {article.authorName}</div>
      </div>
    ))}
  </div>
);

export default HighlightedArticles;

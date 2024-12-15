import React, { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { Link } from "react-router-dom";
import LoadingSpinner from "../shared/loading_spinner";
import { fetchArticles, selectArticles } from "./articles_slice";

const TrendingArticles = () => {
  const dispatch = useDispatch();

  useEffect(() => {
    dispatch(fetchArticles({ collection: "trending" }));
  }, [])

  const articles = useSelector(selectArticles("trending"))

  if (articles.length === 0) {
    return (
      <aside id="trending-articles">
        <h2 className="section-title">Popular</h2>
        <LoadingSpinner />
      </aside>
    );
  }

  const trendingArticles = articles.map(article => (
    <li className="trending-item" key={article.id}>
      <Link to={`/articles/${article.id}`}>
        <img
          className="trend-art-photo"
          src={article.photo.thumbUrl}
          alt={article.photo.altText} />
      </Link>
      <Link to={`/articles/${article.id}`} className="list-headline">
        {article.title}
      </Link>
    </li>
  ))

  return (
    <aside id="trending-articles">
      <h2 className="section-title">Popular</h2>
      <ul>
        {trendingArticles}
      </ul>
    </aside>
  );
};

export default TrendingArticles;

import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import ArticleList from "./article_list";
import LoadingSpinner from "../shared/loading_spinner";
import { selectArticles, fetchArticles } from "./articles_slice";

const LatestArticles = () => {
  const dispatch = useDispatch();

  useEffect(() => {
    dispatch(fetchArticles({ filter: "latest" }))
  }, []);

  const articles = useSelector(selectArticles("latest"));

  return articles.length === 0 ? (
    <aside id="latest-articles">
      <h2 className="section-title">Latest</h2>
      <LoadingSpinner />
    </aside>
  ) : (
    <aside id="latest-articles">
      <h2 className="section-title">Latest</h2>
      <ArticleList articles={articles} />
      <a href="#/archives">See more...</a>
    </aside>
  );
};

export default LatestArticles;

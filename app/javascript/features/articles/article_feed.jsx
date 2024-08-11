import React, { useState, useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import ArticleList from "./article_list";
import LoadingSpinner from "../shared/loading_spinner";

const ArticleFeed = ({ articleSelector, getInitialArticles, getMoreArticles }) => {
  const bucketSize = 5;
  const articles = useSelector(articleSelector) || [];
  const dispatch = useDispatch();

  const [hasAllArticles, setHasAllAticles] = useState(false);
  const [loading, setLoading] = useState(true);
  const [loadingMoreArticles, setLoadingMoreArticles] = useState(false);

  const additionalArticleCheck = (articles) => {
    if (Object.keys(articles).length % bucketSize === 0) {
      setHasAllAticles(false);
      setLoading(false);
      setLoadingMoreArticles(false);
    } else {
      setHasAllAticles(true);
      setLoading(false);
      setLoadingMoreArticles(false);
    }
  }

  useEffect(() => {
    if (getInitialArticles) {
      dispatch(getInitialArticles())
        .then((result => additionalArticleCheck(result.payload.articles)));
    } else {
      additionalArticleCheck(articles)
    }
  }, []);

  if (loading) return <LoadingSpinner />;

  const handleClick = () => {
    setLoadingMoreArticles(true);
    const articleIds = articles.map((article) => article.id)
    dispatch(getMoreArticles(articleIds[articleIds.length - 1]))
      .then((result) => additionalArticleCheck(result.payload.articles));
  };

  const getMoreArticlesButton = hasAllArticles ? (
    null
  ) : (
    <button className="button" onClick={handleClick}>More</button>
  );

  return (
    <div>
      <ArticleList articles={articles} />
      {loadingMoreArticles ? <LoadingSpinner /> : getMoreArticlesButton}
    </div>
  );
};

export default ArticleFeed;

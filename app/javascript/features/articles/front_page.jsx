import React, { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { fetchFrontPage } from "../front_page/front_page_slice";
import FeaturedArticle from "./featured_article";
import HighlightedArticles from "./highlighted_articles";
import LoadingSpinner from "../shared/loading_spinner";

const FrontPage = () => {
  useEffect(() => {
    if (highlightedArticles.length === 0) { dispatch(fetchFrontPage()) }
  }, []);

  const highlightedArticles = useSelector((state) => state.frontPage.highlighted);
  const featuredArticle = useSelector((state) => state.frontPage.featured);

  const dispatch = useDispatch();

  if (highlightedArticles.length === 0) {
    return (
      <section id="front-page">
        <h2 className="section-title">Featured</h2>
        <LoadingSpinner />
      </section>
    );
  }

  return (
    <section id="front-page">
      <h2 className="section-title">Featured</h2>
      <FeaturedArticle article={featuredArticle} />
      <HighlightedArticles articles={highlightedArticles} />
    </section>
  );

}

export default FrontPage;

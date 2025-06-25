import React, { useEffect } from "react";
import { useLocation } from "react-router-dom";
import { useSelector, useDispatch } from "react-redux";
import { fetchAuthorArticles, selectAuthorArticles } from "../articles/articles_slice";
import { fetchAuthor } from "./authors_slice";
import ArticleFeed from "../articles/article_feed";
import LoadingSpinner from "../shared/loading_spinner";

const Author = () => {
  const authorId = useLocation().pathname.slice(9);
  const author = useSelector((state) => state.authors[authorId]) || { articleIds: [] };
  const dispatch = useDispatch();

  useEffect(() => {
    window.scrollTo(0, 0);
    document.title = "Journalists";

    if (!author.name) {
      dispatch(fetchAuthor(authorId));
    }
  }, [authorId]);


  if (!author.name) {
    return (
      <section className="article-section">
        <h2 className="section-title">Author Page</h2>
        <LoadingSpinner />
      </section>
    )
  }

  const lastAuthorArticleId = author.articleIds[author.articleIds.length - 1];
  const getMoreArticles = () => (
    fetchAuthorArticles({
      id: authorId,
      filter: { before: lastAuthorArticleId},
    })
  );

  return (
    <section className="article-section">
      <h2 className="section-title">{author.name}</h2>
      <div id="author-bio">
        <p>Education: {author.education}</p>
        <p>Bio: {author.bio}</p>
      </div>
      <h3 className="subsection-title">Articles from {author.name}</h3>
      <ArticleFeed
        getMoreArticles={getMoreArticles}
        articleSelector={selectAuthorArticles(author.id)}
      />
    </section>
  );
};

export default Author;

import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import ArticleFeed from "./article_feed";
import { fetchArticles, selectArticles } from "./articles_slice";
import { clearedCollection } from "./filters_slice";
import { titleHelper } from "../../util/ui_util";

const Collection = ({ section }) => {
  const dispatch = useDispatch();

  window.scrollTo(0, 0);
  document.title = titleHelper[section];

  useEffect(() => {
    dispatch(clearedCollection());
  }, [section]);

  const getInitialArticles = () => fetchArticles({ collection: section });
  const getMoreArticles = (lastArticleId) => fetchArticles({
    collection: section,
    after: lastArticleId,
  });

  return (
    <section className="article-section" id={section}>
      <h2 className="section-title">{titleHelper[section]}</h2>
      <ArticleFeed
        articleSelector={selectArticles("collection")}
        getInitialArticles={getInitialArticles}
        getMoreArticles={getMoreArticles}
      />
    </section>
  );
};

export const UsCollection = () => <Collection section="us" />

export const PoliticsCollection = () => <Collection section="politics" />

export const SportsCollection = () => <Collection section="sports" />

export const BusinessCollection = () => <Collection section="business" />

export const ArchivesCollection = () => <Collection section="archives" />

export const FavoritesCollection = () => <Collection section="favorites" />

import React from 'react';
import { Route } from 'react-router-dom';

import { ProtectedRoute } from '../util/route_util';
import Footer from '../components/navigation/footer';
import Masthead from '../components/navigation/masthead';
import LatestArticlesContainer from './articles/latest_articles_container';
import FeaturedArticleContainer from './articles/featured_article_container';
import TrendingArticlesContainer from './articles/trending_articles_container';
import ArticleContainer from './articles/article_container';
import SectionContainer from './articles/section_container';
import AuthorContainer from './authors/author_container';
import ArchiveContainer from './articles/archive_container';
import FavoriteArticlesContainer from './articles/favorite_articles_container';
import Modal from './modal/modal';

class App extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div id="app">
        <Masthead />
        <main>
          <Route path="/archives" component={ArchiveContainer} />
          <Route path="/authors/:authorId" component={AuthorContainer} />
          <Route exact path="/" component={LatestArticlesContainer} />
          <Route exact path="/" component={FeaturedArticleContainer} />
          <ProtectedRoute exact path="/favorites" component={FavoriteArticlesContainer} />
          <Route exact path="/articles/:articleId" component={LatestArticlesContainer} />
          <Route path="/section/:sectionName" component={SectionContainer} />
          <Route exact path="/articles/:articleId" component={ArticleContainer} />
          <TrendingArticlesContainer />
        </main>
        <Footer />
        <Modal />
      </div>
    );
  }
};

export default App;
import React from 'react';
import { Route } from 'react-router-dom';

import Footer from '../components/navigation/footer';
import Navigation from '../components/navigation/navigation';
import LatestArticlesContainer from './articles/latest_articles_container';
import FeaturedArticleContainer from './articles/featured_article_container';
import TrendingArticlesContainer from './articles/trending_articles_container';
import ArticleContainer from './articles/article_container';
import SectionContainer from './articles/section_container';
import AuthorContainer from './authors/author_container';
import ArchiveContainer from './articles/archive_container';

class App extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div id="app">
        <Navigation />
        <main>
          <Route path="/archives" component={ArchiveContainer} />
          <Route path="/authors/:authorId" component={AuthorContainer} />
          <Route exact path="/" component={LatestArticlesContainer} />
          <Route exact path="/" component={FeaturedArticleContainer} />
          <Route exact path="/articles/:articleId" component={LatestArticlesContainer} />
          <Route path="/section/:sectionName" component={SectionContainer} />
          <Route exact path="/articles/:articleId" component={ArticleContainer} />
          <TrendingArticlesContainer />
        </main>
        <Footer />
      </div>
    );
  }
};

export default App;
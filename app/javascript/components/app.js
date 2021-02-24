import React from 'react';
import { Route } from 'react-router-dom';

import Footer from '../components/navigation/footer';
import Navigation from '../components/navigation/navigation';
import LatestArticlesContainer from './articles/latest_articles_container';
import FeaturedArticleContainer from './articles/featured_article_container';
import TrendingArticlesContainer from './articles/trending_articles_container';
import ArticleContainer from './articles/article_container';
import SectionContainer from './articles/section_container';

class App extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div id="app">
        <Navigation />
        <main>
          <Route exact path="/" component={LatestArticlesContainer} />
          <Route exact path="/articles/:articleId" component={LatestArticlesContainer} />
          <Route path="/section/:sectionName" component={SectionContainer} />
          <Route exact path="/" component={FeaturedArticleContainer} />
          <Route exact path="/articles/:articleId" component={ArticleContainer} />
          <TrendingArticlesContainer />
        </main>
        <Footer />
      </div>
    );
  }
};

export default App;
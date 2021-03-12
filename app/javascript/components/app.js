import React from 'react';
import { Route } from 'react-router-dom';

import { ProtectedRoute } from '../util/route_util';
import Footer from '../components/navigation/footer';
import Masthead from '../components/navigation/masthead';
import LatestArticlesContainer from './articles/latest_articles_container';
import FrontPageContainer from './articles/front_page_container';
import TrendingArticlesContainer from './articles/trending_articles_container';
import ArticleContainer from './articles/article_container';
import AuthorContainer from './authors/author_container';
import CollectionContainer from './articles/collection_container';
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
          <Route exact path={["/", "/articles/:articleId"]} component={LatestArticlesContainer} />
          <Route exact path="/" component={FrontPageContainer} />
          <Route exact path="/articles/:articleId" component={ArticleContainer} />
          <Route path={"/us"}  component={CollectionContainer} />
          <Route path={"/politics"}  component={CollectionContainer} />
          <Route path={"/business"}  component={CollectionContainer} />
          <Route path={"/sports"}  component={CollectionContainer} />
          <Route path={"/archives"}  component={CollectionContainer} />
          <ProtectedRoute exact path="/favorites" 
            component={(props) => (
              <CollectionContainer {...props} />
              )} />
          <Route path="/authors/:authorId" component={AuthorContainer} />
          <TrendingArticlesContainer />
        </main>
        <Footer />
        <Modal />
      </div>
    );
  }
};

export default App;
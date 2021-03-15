import React from 'react';
import ArticleFeed from './article_feed';
import { titleHelper } from '../../util/ui_util';

class Section extends React.Component {
  componentDidMount() {
    window.scrollTo(0, 0);
  }

  componentWillUnmount() {
    this.props.clearCollectionFilter();
  }

  render() {
    const { 
      section, 
      articles, 
      articleIds, 
      getInitialArticles,
      getMoreArticles 
    } = this.props;

    return (
      <section className="section-archive" id={section}>
        <h2 className="section-title">{titleHelper[section]}</h2>
        <ArticleFeed 
        getInitialArticles={getInitialArticles}
        getMoreArticles={getMoreArticles}
        articleIds={articleIds}
        articles={articles}/>
      </section>
    );
  }
};

export default Section;
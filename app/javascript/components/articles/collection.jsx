import React from 'react';
import ArticleFeed from './article_feed';

class Section extends React.Component {
  componentDidMount() {
    window.scrollTo(0, 0);
  }

  componentWillUnmount() {
    this.props.clearCollectionFilter();
  }

  render() {
    const { 
      sectionTitle, 
      articles, 
      articleIds, 
      getInitialArticles,
      getMoreArticles 
    } = this.props;

    return (
      <section className="section-archive">
        <h2>{sectionTitle}</h2>
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
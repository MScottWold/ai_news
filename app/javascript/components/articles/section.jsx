import React from 'react';
import LatestArticleItem from './latest_article_item';

class Section extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { section, articles } = this.props;
    if (articles.length === 0) {
      this.props.getSectionArticles();
      return (
        <section className="section-archive">
          <p>Loading...</p>
        </section>
      );
    }

    const articleList = articles.map(article => (
      <LatestArticleItem
        key={article.id}
        id={article.id}
        section={article.section}
        title={article.title}
        photo={article.photo} />
    ));

    return (
      <section className="section-archive">
        <h2>Latest in {section}...</h2>
        {articleList}
      </section>
    );
  }
}

export default Section;
import React from 'react';
import ArticleListItem from './article_list_item';

const BUCKET_SIZE = 5;

class ArticleList extends React.Component {
  constructor(props) {
    super(props);
    this.state = { haveAllArticles: false };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    const { articleIds, getMoreArticles } = this.props;
    const lastId = articleIds[articleIds.length - 1];

    getMoreArticles(lastId).then(ids => {
      if (ids.length < BUCKET_SIZE) {
        this.setState({
          haveAllArticles: true
        })
      }
    });
  }

  componentDidMount() {
    window.scrollTo(0, 0);
    if (this.props.articleIds.length < BUCKET_SIZE) {
      this.props.getInitialArticles().then(ids => {
        if (ids.length < BUCKET_SIZE) {
          this.setState({
            haveAllArticles: true
          })
        }
      });
    }
  }

  render() {
    const { sectionTitle, articles, articleIds } = this.props;

    if (articleIds.length === 0) {
      return (
        <section className="section-archive">
          <p>Loading...</p>
        </section>
      );
    }

    const articleList = articles.map(article => (
      <ArticleListItem
        key={article.id}
        id={article.id}
        section={article.section}
        title={article.title}
        photo={article.photo} />
    ));

    const getMoreArticles = this.state.haveAllArticles ? (
        null
      ) : (
        <button onClick={this.handleClick}>Load more articles</button>
      );
      
    return (
      <section className="section-archive">
        <h2>{sectionTitle}</h2>
        {articleList}
        {getMoreArticles}
      </section>
    );
  }
}

export default ArticleList;
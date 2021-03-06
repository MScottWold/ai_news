import React from 'react';
import ArticleList from './article_list';

class ListFeed extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasAllArticles: false };
    this.bucketSize = 5;
    this.handleClick = this.handleClick.bind(this);
    this.additionalArticleCheck = this.additionalArticleCheck.bind(this);
  }

  additionalArticleCheck(articleIds) {
    if (articleIds.length < this.bucketSize) {
      this.setState({ hasAllArticles: true });
    }
  }

  handleClick(e) {
    const button = e.currentTarget;
    button.disabled = true;

    const { articleIds, getMoreArticles } = this.props;
    const lastId = articleIds[articleIds.length - 1];

    getMoreArticles(lastId)
      .then(ids => {
        button.disabled = false;
        this.additionalArticleCheck(ids);
      });
  }

  componentDidMount() {
    this.props.getInitialArticles()
      .then(this.additionalArticleCheck);
  }

  render() {
    const { articles } = this.props;

    if (articles.length === 0) {
      return <p>Loading...</p>;
    }

    const getMoreArticlesButton = this.state.hasAllArticles ? (
      null
    ) : (
      <button onClick={this.handleClick}>Get more articles</button>
    );

    return (
      <div>
        <ArticleList articles={articles} />
        {getMoreArticlesButton}
      </div>
    );
  }
};

export default ListFeed;
import React from 'react';
import ArticleList from './article_list';

class ArticleFeed extends React.Component {
  constructor(props) {
    super(props);
    this.state = { 
      hasAllArticles: false,
      loading: true,
      loadingMoreArticles: false 
    };
    this.bucketSize = 5;
    this.handleClick = this.handleClick.bind(this);
    this.additionalArticleCheck = this.additionalArticleCheck.bind(this);
  }

  additionalArticleCheck(articleIds) {
    if (articleIds.length < this.bucketSize) {
      this.setState({ 
        hasAllArticles: true,
        loading: false,
        loadingMoreArticles: false
      });
    } else {
      this.setState({
        loading: false,
        loadingMoreArticles: false
      });
    }
  }

  handleClick() {
    this.setState({ loadingMoreArticles: true });

    const { articleIds, getMoreArticles } = this.props;
    const lastId = articleIds[articleIds.length - 1];

    getMoreArticles(lastId)
      .then(this.additionalArticleCheck);
  }

  componentDidMount() {
    this.props.getInitialArticles()
      .then(this.additionalArticleCheck);
  }

  render() {
    const { articles } = this.props;
    const loadingSpinner = <div className="loading-spinner"></div>;

    if (this.state.loading) {
      return loadingSpinner;
    }

    const getMoreArticlesButton = this.state.hasAllArticles ? (
      null
    ) : (
      <button onClick={this.handleClick}>More</button>
    );

    return (
      <div>
        <ArticleList articles={articles} />
        {this.state.loadingMoreArticles ? loadingSpinner : getMoreArticlesButton}
      </div>
    );
  }
};

export default ArticleFeed;
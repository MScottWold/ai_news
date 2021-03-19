import React from 'react';
import ArticlePhoto from '../photos/article_photo';
import { sectionNames } from '../../util/ui_util';
import CommentsContainer from '../comments/comments_container';

class Article extends React.Component {
  constructor(props) {
    super(props);
    this.state = { showComments: false };
    this.checkForArticleBody = this.checkForArticleBody.bind(this);
    this.toggleFavoriteStatus = this.toggleFavoriteStatus.bind(this);
  }

  checkForArticleBody() {
    const { article, getArticle } = this.props;

    if (!article || !article.body) {
      getArticle()
        .then((receivedArticle) => document.title = receivedArticle.title);
    } else {
      document.title = article.title;
    }
  }

  toggleFavoriteStatus() {
    if (this.props.article.favorited) {
      this.props.unfavoriteArticle();
    } else {
      this.props.favoriteArticle();
    }
  }

  componentDidMount() {
    window.scrollTo(0, 0);
    this.checkForArticleBody();
  }

  componentDidUpdate(prevProps) {
    if (this.props.article.id !== prevProps.article.id) {
      window.scrollTo(0, 0);
      this.checkForArticleBody();
      this.setState({ showComments: false });
    }
  }

  render() {
    const { article, loggedIn } = this.props;

    if (!article || !article.body) {
      return (
        <article className="article">
          <div className="loading-spinner"></div>
        </article>
      );
    }
    
    const paragraphs = article.body
      .split('\r\n\r\n')
      .map((para, idx) => <p key={idx} >{para}</p>)

    const publishDate = new Date(article.createdAt).toUTCString();

    const favoriteButton = loggedIn ? (
      <div id="favorite-container">
        <div 
          className={`star${article.favorited ? "-favorite" : ""}`}
          onClick={this.toggleFavoriteStatus}>
        </div>
        <div>{sectionNames[article.section]}</div>
      </div>
    ) : (
        <div>{sectionNames[article.section]}</div>
    );

    const showComments = this.state.showComments ? (
      <button onClick={() => this.setState({ showComments: false })}>
        Hide Comments
      </button>
    ) : (
      <button onClick={() => this.setState({ showComments: true })}>
        Show Comments
      </button>
    );

    return (
      <article className="article">
        {favoriteButton}
        <h1 className="article-headline">
          {article.title}
        </h1>
        <div className="byline">
          <div>By <a href={`#/authors/${article.authorId}`} className="author-name">{article.authorName}</a></div>
          <div>{publishDate}</div>
        </div>
        <ArticlePhoto photo={article.photo} />
        <div className="article-body">
          {paragraphs}
        </div>
        {showComments}
        {this.state.showComments 
          ? <CommentsContainer articleId={article.id} loggedIn={loggedIn} />
          : null}
      </article>
    );
  }
}

export default Article;
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
      getArticle();
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
    this.checkForArticleBody();
  }

  componentDidUpdate(prevProps) {
    if (this.props.article.id !== prevProps.article.id) {
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
      <div 
        className={`star${article.favorited ? "-favorite" : ""}`}
        onClick={this.toggleFavoriteStatus}>
      </div>
    ) : (
        null
    );

    const showComments = this.state.showComments ? (
      <button 
        className="comments-button"
        onClick={() => this.setState({ showComments: false })}>
        Hide Comments
      </button>
    ) : (
      <button 
        className="comments-button"
        onClick={() => this.setState({ showComments: true })}>
        Show Comments
      </button>
    );

    return (
      <article className="article">
        <div>{sectionNames[article.section]}</div>
        <h1 className="article-headline">
          {favoriteButton}
          {article.title}
        </h1>
        <div className="byline">
          <div>By <a href={`#/authors/${article.authorId}`} className="author-name">{article.authorName}</a></div>
          <div>{publishDate}</div>
        </div>
        <ArticlePhoto photo={article.photo} />
        {paragraphs}
        {showComments}
        {this.state.showComments 
          ? <CommentsContainer articleId={article.id} loggedIn={loggedIn} />
          : null}
      </article>
    );
  }
}

export default Article;
import React from 'react';
import ArticlePhoto from '../photos/article_photo';
import { sectionNames } from '../../util/ui_util';

class Article extends React.Component {
  constructor(props) {
    super(props);

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

  componentDidUpdate() {
    this.checkForArticleBody();
  }

  render() {
    const { article, loggedIn } = this.props;

    if (!article || !article.body) {
      return (
        <article className="article">
          <p>Loading...</p>
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
        {/* {article.favorited ? "unfavorite" : "favorite"} */}
      </div>
    ) : (
        null
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
      </article>
    );
  }
}

export default Article;
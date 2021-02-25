import React from 'react';
import ArticlePhoto from '../photos/article_photo';

class Article extends React.Component {
  constructor(props) {
    super(props);

    this.getArticleContent = this.getArticleContent.bind(this);
  }

  getArticleContent(id) {
    this.props.getArticle(id);
  }

  render() {
    const { article, match } = this.props;

    if (!article || !article.body) {
      const id = match.params.articleId;
      this.getArticleContent(id);
      return (
        <article className="article">
          <p>Loading...</p>
        </article>
      );
    }
    const paragraphs = article.body
      .split('\r\n\r\n')
      .map((para, idx) => <p key={idx} >{para}</p>)

    const publishDate = new Date(article.createdAt).toDateString();

    return (
      <article className="article">
        <h1 className="article-headline">{article.title}</h1>
        <div className="byline">
          by <a href={`#/authors/${article.authorId}`} className="author-name">{article.authorName}</a>; {publishDate}
        </div>
        <ArticlePhoto photo={article.photo} />
        {paragraphs}
      </article>
    );
  }
}

export default Article;
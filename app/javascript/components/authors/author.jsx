import React from 'react';
import LatestArticleItem from '../articles/latest_article_item';

class Author extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    window.scrollTo(0, 0);
    this.props.getAuthor();
  }

  render() {
    const { author, articles } = this.props;
    if (!author) {
      return (
        <section><h1>Loading...</h1></section>
      )
    }

    const articleList = articles.map(article => (
      <LatestArticleItem 
      key={article.id}
      photo={article.photo}
      section={article.section}
      title={article.title}
      id={article.id}/>
    ));

    return (
      <section>
        <h2>{author.name}</h2>
        <p>Education: {author.education}</p>
        <p>Bio: {author.bio}</p>
        <h2>Articles from {author.name}</h2>
        {articleList}
      </section>
    );
  }
}

export default Author;
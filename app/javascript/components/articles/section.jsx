import ArticleList from './article_list';

class Section extends ArticleList {
  componentDidUpdate() {
    if (this.props.articleIds.length === 0) {
      this.props.getInitialArticles();
    }
  }
}

export default Section;
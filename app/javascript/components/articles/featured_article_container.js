import { connect } from 'react-redux';
import { getArticles } from '../../actions/article_actions';
import { selectArticles } from '../../reducers/selectors';
import FeaturedArticle from './featured_article';

const mapStateToProps = state => {
  const articleId = state.ui.filters.featuredArticleId;

  return {
    article: selectArticles(state.entities, articleId)
  };
};

const mapDispatchToProps = dispatch => ({
  getFeaturedArticle: () => dispatch(getArticles({ filter: 'featured' }))
});

const FeaturedArticleContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(FeaturedArticle);

export default FeaturedArticleContainer;
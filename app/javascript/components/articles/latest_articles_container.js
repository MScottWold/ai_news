import { connect } from 'react-redux';
import { selectArticles } from '../../reducers/selectors';
import { getArticles } from '../../actions/article_actions';
import LatestArticles from './latest_articles';

const mapStateToProps = state => {
  const articleIds = state.ui.filters.latestArticleIds;

  return {
    articles: selectArticles(state.entities, articleIds)
  };
};

const mapDispatchToProps = dispatch => ({
  getLatestArticles: () => dispatch(getArticles({ filter: 'latest' }))
});

const LatestArticlesContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(LatestArticles);

export default LatestArticlesContainer;
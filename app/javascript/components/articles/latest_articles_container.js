import { connect } from 'react-redux';
import { selectArticles } from '../../reducers/selectors';
import { getArticles } from '../../actions/article_actions';
import LatestArticles from './latest_articles';

const mapStateToProps = state => {
  let articleIds = state.ui.filters.latest 
    ? state.ui.filters.latest.slice(0, 5) : [];

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
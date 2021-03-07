import { connect } from 'react-redux';
import { getArticles } from '../../actions/article_actions';
import { selectArticles } from '../../reducers/selectors';
import TrendingArticles from './trending_articles';


const mapStateToProps = state => {
  const articleIds = state.ui.filters.trending ? state.ui.filters.trending : [];
  const articles = selectArticles(state.entities, articleIds);

  return { articles };
};

const mapDispatchToProps = dispatch => ({
  getTrendingArticles: () => dispatch(getArticles({collection: 'trending'}))
});

const TrendingArticlesContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(TrendingArticles);

export default TrendingArticlesContainer;
import { connect } from 'react-redux';
import { getArticles } from '../../actions/article_actions';
import { selectArticles } from '../../reducers/selectors';
import TrendingArticles from './trending_articles';


const mapStateToProps = state => {
  const articleIds = state.ui.filters.trendingArticleIds;
  return {
    articles: selectArticles(state.entities, articleIds)
  };
};

const mapDispatchToProps = dispatch => ({
  getTrendingArticles: () => dispatch(getArticles({filter: 'trending'}))
});

const TrendingArticlesContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(TrendingArticles);

export default TrendingArticlesContainer;
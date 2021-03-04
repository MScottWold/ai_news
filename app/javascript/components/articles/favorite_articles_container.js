import { connect } from 'react-redux';
import ArticleList from './article_list';
import { getArticles } from '../../actions/article_actions';
import { selectArticles } from '../../reducers/selectors';

const mapStateToProps = (state) => {
  const articleIds = state.ui.filters.favorites ? state.ui.filters.favorites : [];
  const articles = selectArticles(state.entities, articleIds);

  return {
    sectionTitle: 'Favorites',
    articleIds,
    articles
  };
};

const mapDispatchToProps = (dispatch) => ({
  getInitialArticles: () => dispatch(getArticles({ filter: 'favorites' })),
  getMoreArticles: (id) => dispatch(getArticles({ filter: 'favorites', after: id }))
});

const FavoriteArticlesContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(ArticleList);

export default FavoriteArticlesContainer;
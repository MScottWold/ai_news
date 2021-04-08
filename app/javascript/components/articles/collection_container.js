import { connect } from 'react-redux';
import { getArticles } from '../../actions/article_actions';
import { clearCollectionFilter } from '../../actions/filter_actions';
import { selectArticles } from '../../reducers/selectors';
import Collection from './collection';

const mapStateToProps = (state, { location }) => {
  const section = location.pathname.slice(1);
  const articleIds = state.ui.filters.collection || [];
  const articles = selectArticles(state.entities, articleIds);

  return {
    section,
    articleIds,
    articles
  };
};

const mapDispatchToProps = (dispatch, { location }) => {
  const section = location.pathname.slice(1);
  return {
    getInitialArticles: () => dispatch(getArticles({ collection: section })),
    getMoreArticles: (id) => dispatch(getArticles({ collection: section, after: id })),
    clearCollectionFilter: () => dispatch(clearCollectionFilter())
  };
};

const CollectionContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(Collection);

export default CollectionContainer;
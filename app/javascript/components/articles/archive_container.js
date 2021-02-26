import { connect } from 'react-redux';
import ArticleList from './article_list';
import { getArticles } from '../../actions/article_actions';
import { selectArticles } from '../../reducers/selectors';

const mapStateToProps = (state) => {
  const articleIds = state.ui.filters.latest ? state.ui.filters.latest : [];
  const articles = selectArticles(state.entities, articleIds);

  return {
    sectionTitle: 'Archives',
    articleIds,
    articles
  };
};

const mapDispatchToProps = (dispatch) => ({
  getInitialArticles: () => dispatch(getArticles({ filter: 'latest' })),
  getMoreArticles: (id) => dispatch(getArticles({ filter: 'latest', after: id }))
});

const ArchiveContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(ArticleList);

export default ArchiveContainer;
import { connect } from 'react-redux';
import { getAuthor } from '../../actions/author_actions';
import { selectAuthor, selectArticles } from '../../reducers/selectors';
import Author from './author';

const mapStateToProps = (state, ownProps) => {
  const authorId = ownProps.match.params.authorId;
  const author = selectAuthor(state.entities, authorId);
  const articles = selectArticles(state.entities, author.articleIds)

  return {
    author,
    articles
  };
};

const mapDispatchToProps = (dispatch, ownProps) => {
  const authorId = ownProps.match.params.authorId;

  return {
    getAuthor: () => dispatch(getAuthor(authorId))
  };
};

const AuthorContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(Author);

export default AuthorContainer;
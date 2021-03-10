import { connect } from 'react-redux';
import { getComments, postComment } from '../../actions/comment_actions';
import Comments from './comments';

const mapStateToProps = (state, { loggedIn, articleId }) => ({
  comments: state.entities.comments,
  articleId,
  loggedIn
});

const mapDispatchToProps = (dispatch, { articleId }) => ({
  postComment: (formComment) => dispatch(postComment(formComment)),
  getComments: () => dispatch(getComments(articleId)),
  getOlderComments: (id) => dispatch(getComments(articleId, { before: id })),
  getNewerComments: (id) => dispatch(getComments(articleId, { after: id }))
});

const CommentsContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(Comments);

export default CommentsContainer;
import {
  RECEIVE_COMMENTS,
  RECEIVE_OLDER_COMMENTS,
  RECEIVE_NEWER_COMMENTS,
  RECEIVE_SINGLE_COMMENT
} from '../actions/comment_actions';

const commentsReducer = (state = [], action) => {
  switch (action.type) {
    case RECEIVE_COMMENTS:
      return action.comments;
    case RECEIVE_OLDER_COMMENTS:
      return [...state, ...action.comments];
    case RECEIVE_NEWER_COMMENTS:
      return [...action.comments, ...state];
    case RECEIVE_SINGLE_COMMENT:
      return [action.comment, ...state];
    default:
      return state;
  }
};

export default commentsReducer;
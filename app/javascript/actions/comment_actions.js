import * as API from '../util/api_util';

// action types
export const RECEIVE_COMMENTS = 'RECEIVE_COMMENTS';
export const RECEIVE_OLDER_COMMENTS = 'RECEIVE_OLDER_COMMENTS';
export const RECEIVE_NEWER_COMMENTS = 'RECEIVE_NEWER_COMMENTS';
export const RECEIVE_SINGLE_COMMENT = 'RECEIVE_SINGLE_COMMENT';

// action creators
const receiveComments = comments => ({
  type: RECEIVE_COMMENTS,
  comments
});

const receiveOlderComments = comments => ({
  type: RECEIVE_OLDER_COMMENTS,
  comments
});

const receiveNewerComments = comments => ({
  type: RECEIVE_NEWER_COMMENTS,
  comments
});

const receiveSingleComment = comment => ({
  type: RECEIVE_SINGLE_COMMENT,
  comment
});

// action thunks
export const getComments = (articleId, filter = {}) => dispatch => {
  return API.getComments(articleId, filter)
    .then(comments => {
      if (filter.before) {
        dispatch(receiveOlderComments(comments));
      } else if (filter.after) {
        dispatch(receiveNewerComments(comments));
      } else {
        dispatch(receiveComments(comments));
      }
      return comments;
    });
};

export const postComment = formComment => dispatch => {
  return API.postComment(formComment)
    .then(comment => dispatch(receiveSingleComment(comment)));
};
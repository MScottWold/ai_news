import * as API from '../util/api_util';

// action types
export const RECEIVE_AUTHOR = 'RECEIVE_AUTHOR';

// action creators
const receiveAuthor = payload => ({
  type: RECEIVE_AUTHOR,
  author: payload.author,
  articles: payload.articles
});

// action thunks
export const getAuthor = (id) => (dispatch) => {
  return API.getAuthor(id)
    .then(payload => {
      dispatch(receiveAuthor(payload));
      return payload.articleIds;
    });
};
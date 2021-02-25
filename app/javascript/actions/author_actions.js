import * as API from '../util/api_util';

export const RECEIVE_AUTHOR = 'RECEIVE_AUTHOR';

export const receiveAuthor = payload => ({
  type: RECEIVE_AUTHOR,
  author: payload.author,
  articles: payload.articles
});

export const getAuthor = (id) => (dispatch) => {
  return API.getAuthor(id)
    .then(author => dispatch(receiveAuthor(author)));
};
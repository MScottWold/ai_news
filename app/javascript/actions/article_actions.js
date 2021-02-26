import * as API from '../util/api_util';

// action types
export const RECEIVE_ARTICLES = 'RECEIVE_ARTICLES';
export const RECEIVE_ADDITIONAL_ARTICLES = 'RECEIVE_ADDITIONAL_ARTICLES';
export const RECEIVE_SINGLE_ARTICLE = 'RECEIVE_SINGLE_ARTICLE';

// action creators
export const receiveArticles = payload => ({
  type: RECEIVE_ARTICLES,
  articles: payload.articles,
  filter: payload.filter
});

export const receiveAdditionalArticles = payload => ({
  type: RECEIVE_ADDITIONAL_ARTICLES,
  articles: payload.articles,
  filter: payload.filter
});

export const receiveSingleArticle = article => ({
  type: RECEIVE_SINGLE_ARTICLE,
  article
});

// action thunks
export const getArticles = filter => dispatch => {
  return API.getArticles(filter)
    .then(payload => {
      const filterName = filter.filter;

      if (filter.after) {
        dispatch(receiveAdditionalArticles(payload));
      } else {
        dispatch(receiveArticles(payload));
      }

      // Return IDs for pagination check
      return payload.filter[filterName];
    });
};

export const getArticle = id => dispatch => {
  return API.getSingleArticle(id)
    .then(payload => dispatch(receiveSingleArticle(payload)));
};
import * as API from '../util/api_util';

// action types
export const RECEIVE_ARTICLES = 'RECEIVE_ARTICLES';
export const RECEIVE_SINGLE_ARTICLE = 'RECEIVE_SINGLE_ARTICLE';

// action creators
export const receiveArticles = (payload) => ({
  type: RECEIVE_ARTICLES,
  articles: payload.articles,
  articleFilter: payload.articleFilter
});

export const receiveSingleArticle = (article) => ({
  type: RECEIVE_SINGLE_ARTICLE,
  article
});

// action thunks
export const getArticles = (filter) => (dispatch) => {
  return API.getArticles(filter)
    .then(articles => dispatch(receiveArticles(articles)));
};

export const getArticle = (id) => (dispatch) => {
  return API.getSingleArticle(id)
    .then(article => dispatch(receiveSingleArticle(article)));
};
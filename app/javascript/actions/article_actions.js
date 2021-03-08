import * as API from '../util/api_util';

// action types
export const RECEIVE_ARTICLES = 'RECEIVE_ARTICLES';
export const RECEIVE_ADDITIONAL_ARTICLES = 'RECEIVE_ADDITIONAL_ARTICLES';
export const RECEIVE_AUTHOR_ARTICLES = 'RECEIVE_AUTHOR_ARTICLES';
export const RECEIVE_SINGLE_ARTICLE = 'RECEIVE_SINGLE_ARTICLE';
export const FAVORITE_ARTICLE = 'FAVORITE_ARTICLE';
export const UNFAVORITE_ARTICLE = 'UNFAVORITE_ARTICLE';

// action creators
const receiveArticles = payload => ({
  type: RECEIVE_ARTICLES,
  articles: payload.articles,
  filter: payload.filter
});

const receiveAdditionalArticles = payload => ({
  type: RECEIVE_ADDITIONAL_ARTICLES,
  articles: payload.articles,
  filter: payload.filter
});

const receiveAuthorArticles = payload => ({
  type: RECEIVE_AUTHOR_ARTICLES,
  authorId: payload.authorId,
  articles: payload.articles,
  articleIds: payload.articleIds
});

const receiveSingleArticle = article => ({
  type: RECEIVE_SINGLE_ARTICLE,
  article
});

const receiveFavoriteArticleId = articleId => ({
  type: FAVORITE_ARTICLE,
  articleId
});

const receiveUnfavoriteArticleId = articleId => ({
  type: UNFAVORITE_ARTICLE,
  articleId
});

// action thunks
export const getArticles = (filter) => dispatch => {
  return API.getArticles(filter)
    .then(payload => {
      if (filter.after) {
        dispatch(receiveAdditionalArticles(payload));
      } else {
        dispatch(receiveArticles(payload));
      }
      // Return IDs for pagination check
      const filterName = Object.keys(payload.filter)[0];
      return payload.filter[filterName];
    });
};

export const getArticle = id => dispatch => {
  return API.getSingleArticle(id)
    .then(payload => dispatch(receiveSingleArticle(payload)));
};

export const getAuthorArticles = (authorId, filter) => dispatch => {
  return API.getAuthorArticles(authorId, filter)
    .then(payload => {
      dispatch(receiveAuthorArticles(payload));
      return payload.articleIds;
    })
};

export const favoriteArticle = articleId => dispatch => {
  dispatch(receiveFavoriteArticleId(articleId))
  return API.postFavorite(articleId)
    .then(null, () => dispatch(receiveUnfavoriteArticleId(articleId)));
};

export const unfavoriteArticle = articleId => dispatch => {
  dispatch(receiveUnfavoriteArticleId(articleId))
  return API.deleteFavorite(articleId)
    .then(null, () => dispatch(receiveFavoriteArticleId(articleId)));
}
import { 
  RECEIVE_ARTICLES,
  RECEIVE_ADDITIONAL_ARTICLES, 
  RECEIVE_SINGLE_ARTICLE,
  FAVORITE_ARTICLE,
  UNFAVORITE_ARTICLE,
  RECEIVE_AUTHOR_ARTICLES 
} from '../actions/article_actions';
import { RECEIVE_AUTHOR } from '../actions/author_actions';

const articlesReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_ARTICLES:
      if (action.filter.featured) {
        return Object.assign({}, state, action.articles)
      }
      return Object.assign({}, action.articles, state);
    case RECEIVE_ADDITIONAL_ARTICLES:
      return Object.assign({}, action.articles, state);
    case RECEIVE_SINGLE_ARTICLE:
      return Object.assign({}, state, action.article);
    case RECEIVE_AUTHOR:
      return Object.assign({}, action.articles, state);
    case RECEIVE_AUTHOR_ARTICLES:
      return Object.assign({}, action.articles, state)
    case FAVORITE_ARTICLE: {
      const { articleId } = action;
      const article = Object.assign({}, state[articleId], { favorited: true });
      return Object.assign({}, state, { [articleId]: article });
    }
    case UNFAVORITE_ARTICLE: {
      const { articleId } = action;
      const article = Object.assign({}, state[articleId], { favorited: false });
      return Object.assign({}, state, { [articleId]: article });
    }
    default:
      return state;
  }
};

export default articlesReducer;
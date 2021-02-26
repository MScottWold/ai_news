import { 
  RECEIVE_ARTICLES,
  RECEIVE_ADDITIONAL_ARTICLES, 
  RECEIVE_SINGLE_ARTICLE 
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
    default:
      return state;
  }
};

export default articlesReducer;
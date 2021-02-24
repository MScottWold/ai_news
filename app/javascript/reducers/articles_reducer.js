import { 
  RECEIVE_ARTICLES, 
  RECEIVE_SINGLE_ARTICLE 
} from '../actions/article_actions';

const articlesReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_ARTICLES:
      return Object.assign({}, state, action.payload.articles);
    case RECEIVE_SINGLE_ARTICLE:
      return Object.assign({}, state, action.article)
    default:
      return state;
  }
};

export default articlesReducer;
import { RECEIVE_ARTICLES } from '../actions/article_actions';

const _initialFilter = {
  latestArticleIds: [],
  trendingArticleIds: [],
  featuredArticleId: []
};

const filtersReducer = (state = _initialFilter, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_ARTICLES:
      return Object.assign({}, state, action.articleFilter);
    default:
      return state;
  }
}

export default filtersReducer;
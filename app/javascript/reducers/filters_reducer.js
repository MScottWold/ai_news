import { 
  RECEIVE_ARTICLES, 
  RECEIVE_ADDITIONAL_ARTICLES
} from '../actions/article_actions';
import { CLEAR_COLLECTION_FILTER } from '../actions/filter_actions';

const filtersReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_ARTICLES:
      return Object.assign({}, state, action.filter);
    case RECEIVE_ADDITIONAL_ARTICLES: {
      const filterName = Object.keys(action.filter)[0];
      const updatedFilter = {
        [filterName]: [...state[filterName], ...action.filter[filterName]]
      };
      return Object.assign({}, state, updatedFilter)
    }
    case CLEAR_COLLECTION_FILTER:
      return Object.assign({}, state, { collection: [] })
    default:
      return state;
  }
}

export default filtersReducer;
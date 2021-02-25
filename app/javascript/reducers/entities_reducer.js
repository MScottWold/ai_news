import { combineReducers } from 'redux';
import articlesReducer from './articles_reducer';
import authorsReducer from './authors_reducer';

const entitiesReducer = combineReducers({
  articles: articlesReducer,
  authors: authorsReducer
});

export default entitiesReducer;
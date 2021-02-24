import { combineReducers } from 'redux';
import articlesReducer from './articles_reducer';

const entitiesReducer = combineReducers({
  articles: articlesReducer
});

export default entitiesReducer;
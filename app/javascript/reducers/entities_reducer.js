import { combineReducers } from 'redux';
import articlesReducer from './articles_reducer';
import authorsReducer from './authors_reducer';
import commentsReducer from './comments_reducer';

const entitiesReducer = combineReducers({
  articles: articlesReducer,
  authors: authorsReducer,
  comments: commentsReducer
});

export default entitiesReducer;
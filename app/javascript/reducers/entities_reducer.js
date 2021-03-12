import { combineReducers } from 'redux';
import articlesReducer from './articles_reducer';
import authorsReducer from './authors_reducer';
import commentsReducer from './comments_reducer';
import frontPageReducer from './front_page_reducer';

const entitiesReducer = combineReducers({
  articles: articlesReducer,
  frontPage: frontPageReducer,
  authors: authorsReducer,
  comments: commentsReducer
});

export default entitiesReducer;
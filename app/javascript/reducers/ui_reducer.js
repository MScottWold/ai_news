import { combineReducers } from 'redux';
import filtersReducer from './filters_reducer';
import currentUserReducer from './current_user_reducer';
import modalReducer from './modal_reducer';

const uiReducer = combineReducers({
  currentUser: currentUserReducer,
  modal: modalReducer,
  filters: filtersReducer
});

export default uiReducer;
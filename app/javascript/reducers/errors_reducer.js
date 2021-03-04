import { 
  RECEIVE_CURRENT_USER, 
  RECEIVE_LOGIN_ERRORS 
} from '../actions/session_actions';
import { HIDE_MODAL } from '../actions/modal_actions';

const errorsReducer = (state = [], action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_LOGIN_ERRORS:
      return [...action.errors];
    case RECEIVE_CURRENT_USER:
      return [];
    case HIDE_MODAL:
      return [];
    default:
      return state;
  }
};

export default errorsReducer;
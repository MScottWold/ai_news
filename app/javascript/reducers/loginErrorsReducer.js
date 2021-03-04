import {
  RECEIVE_CURRENT_USER,
  RECEIVE_LOGIN_ERRORS
} from '../actions/session_actions';

const loginErrorsReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_LOGIN_ERRORS:
      return Object.assign({}, state, action.errors);
    case RECEIVE_CURRENT_USER:
      return Object.assign({}, state, { loginErrors: null });
    default:
      return state;
  }
};

export default loginErrorsReducer;
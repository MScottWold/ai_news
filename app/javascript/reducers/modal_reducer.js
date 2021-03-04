import { HIDE_MODAL, SHOW_MODAL } from '../actions/modal_actions';
import { RECEIVE_CURRENT_USER } from '../actions/session_actions';

const modalReducer = (state = null, action) => {
  switch (action.type) {
    case SHOW_MODAL:
      return action.modal;
    case HIDE_MODAL:
      return null;
    case RECEIVE_CURRENT_USER:
      return null;
    default:
        return state;
  }
};

export default modalReducer;
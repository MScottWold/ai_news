import { RECEIVE_AUTHOR } from '../actions/author_actions';

const authorsReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_AUTHOR:
      return Object.assign({}, state, action.author);
    default:
      return state;
  }
};

export default authorsReducer;
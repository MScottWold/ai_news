import { RECEIVE_FRONT_PAGE } from '../actions/front_page_actions';

const _emptyPage = { featured: {}, highlighted: [] };

const frontPageReducer = (state = _emptyPage, action) => {
  switch (action.type) {
    case RECEIVE_FRONT_PAGE:
      return action.frontPage;
    default:
      return state;
  }
};

export default frontPageReducer;
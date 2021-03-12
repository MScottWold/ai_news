import * as API from '../util/api_util';

// action types
export const RECEIVE_FRONT_PAGE = 'RECEIVE_FRONT_PAGE';

// action creators
const receiveFrontPage = payload => ({
  type: RECEIVE_FRONT_PAGE,
  frontPage: payload
});

// action thunks
export const getFrontPage = () => dispatch => {
  return API.getFrontPage()
    .then(payload => dispatch(receiveFrontPage(payload)));
}
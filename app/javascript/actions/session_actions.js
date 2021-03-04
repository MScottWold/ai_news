import * as API from '../util/api_util';

// action types
export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_LOGIN_ERRORS = 'RECEIVE_LOGIN_ERRORS';

// action creators
export const receieveCurrentUser = username => ({
  type: RECEIVE_CURRENT_USER,
  username
});

export const receiveLoginErrors = errors => ({
  type: RECEIVE_LOGIN_ERRORS,
  errors
});

// action thunks
export const login = formUser => dispatch => {
  return API.postSession(formUser)
    .then(
      payload => {
        dispatch(receieveCurrentUser(payload.username));
        window.location.reload();
      },
      errors => dispatch(receiveLoginErrors(errors.responseJSON))
    )
};

export const logout = () => dispatch => {
  return API.deleteSession()
    .then(() => {
      dispatch(receieveCurrentUser(null));
      window.location.reload();
    });
};

export const createUser = user => dispatch => {
  return API.postUser(user)
    .then(
      payload => dispatch(receieveCurrentUser(payload.username)),
      errors => dispatch(receiveLoginErrors(errors.responseJSON)) 
    )
};
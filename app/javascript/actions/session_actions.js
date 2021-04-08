import * as API from '../util/api_util';

// action types
export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const RECEIVE_LOGIN_ERRORS = 'RECEIVE_LOGIN_ERRORS';

// action creators
const receieveCurrentUser = username => ({
  type: RECEIVE_CURRENT_USER,
  username
});

const receiveLoginErrors = errors => ({
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

function validatePassword(password) {
  let pswReg = new RegExp('(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*-])(?=.*[0-9]).{8,}');
  return pswReg.test(password);
}

export const createUser = formUser => dispatch => {
  if (formUser.user.password.length < 8) {
    dispatch(receiveLoginErrors(['Password must be at least 8 characters long']));
    return;
  } 
  
  if (!validatePassword(formUser.user.password)) {
    dispatch(receiveLoginErrors(['Password must contain at least: one lowercase letter, one uppercase letter, & one special character (!@#$%^&*-)']));
    return;
  }

  return API.postUser(formUser)
    .then(
      payload => dispatch(receieveCurrentUser(payload.username)),
      errors => dispatch(receiveLoginErrors(errors.responseJSON)) 
    )
};
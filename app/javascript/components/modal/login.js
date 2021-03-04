import { connect } from 'react-redux';
import { hideModal } from '../../actions/modal_actions';
import { login } from '../../actions/session_actions';
import SessionForm from './session_form';

const mapStateToProps = state => ({
  errors: state.errors,
  submitText: 'log in'
});

const mapDispatchToProps = dispatch => ({
  hideModal: () => dispatch(hideModal()),
  submitFormData: (formUser) => dispatch(login(formUser))
});

const Login = connect(
  mapStateToProps,
  mapDispatchToProps
)(SessionForm);

export default Login;
import { connect } from 'react-redux';
import { hideModal } from '../../actions/modal_actions';
import { createUser } from '../../actions/session_actions';
import SessionForm from './session_form';

const mapStateToProps = state => ({
  errors: state.errors,
  submitText: 'sign up'
});

const mapDispatchToProps = dispatch => ({
  submitFormData: (formUser) => dispatch(createUser(formUser))
});

const SignUp = connect(
  mapStateToProps,
  mapDispatchToProps
)(SessionForm);

export default SignUp;
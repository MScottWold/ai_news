import { connect } from 'react-redux';
import Greeting from './greeting';
import { showModal } from '../../actions/modal_actions';
import { logout } from '../../actions/session_actions';

const mapStateToProps = state => {
  const username = state.ui.currentUser

  return {
    loggedIn: Boolean(username),
    username
  };
};

const mapDispatchToProps = dispatch => ({
  showModal: (modal) => dispatch(showModal(modal)),
  logout: () => dispatch(logout())
});

const GreetingContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(Greeting);

export default GreetingContainer;
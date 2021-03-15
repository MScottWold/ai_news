import { connect } from 'react-redux';
import { hideModal } from '../../actions/modal_actions';
import Modal from './modal';

const mapStateToProps = state => ({
  modalType: state.ui.modal
});

const mapDispatchToProps = dispatch => ({
  hideModal: () => dispatch(hideModal())
});

const ModalContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(Modal);

export default ModalContainer;
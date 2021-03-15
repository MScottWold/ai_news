import React from 'react';
import Login from './login';
import SignUp from './signup';

const Modal = ({ modalType, hideModal }) => {
  let modal;
  switch (modalType) {
    case 'login':
      modal = <Login />;
      break;
    case 'signup':
      modal = <SignUp />;
      break;
    default:
      return null;
  }

  return (
    <div id="modal-mask" onClick={hideModal}>
      <div id="modal-container" onClick={(e) => e.stopPropagation()}>
        <div id="hide-modal" onClick={hideModal}>X</div>
        {modal}
      </div>
    </div>
  )
};

export default Modal;
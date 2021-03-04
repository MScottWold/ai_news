import React from 'react';
import { useSelector } from 'react-redux';
import Login from './login';
import SignUp from './signup';

const Modal = () => {
  const modal = useSelector(state => state.ui.modal);

  switch (modal) {
    case 'login':
      return <Login />;
    case 'signup':
      return <SignUp />;
    default:
      return null;
  }
};

export default Modal;
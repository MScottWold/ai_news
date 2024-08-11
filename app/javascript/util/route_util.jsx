import React from 'react';
import { Navigate } from 'react-router-dom';
import { useSelector } from 'react-redux';
import { selectCurrentUser } from '../features/session/session_slice';

const ProtectedRoute = ({protected: Protected}) => {
  const currentUser = useSelector(selectCurrentUser);

  return (currentUser ? <Protected /> : <Navigate to="/" />);
};

export default ProtectedRoute;

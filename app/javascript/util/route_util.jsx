import React from 'react';
import { Redirect, Route } from 'react-router-dom';
import { connect } from 'react-redux';

const Protected = ({ component: Component, path, exact, loggedIn }) => (
  <Route exact={exact} path={path} render={(props) => (
    loggedIn ? (
      <Component {...props} />
    ) : (
      <Redirect to="/" />
    )
  )}/>
);

const mapStateToProps = state => ({
  loggedIn: Boolean(state.ui.currentUser)
});

export const ProtectedRoute = connect(mapStateToProps)(Protected);
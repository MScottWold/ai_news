import * as React from 'react';
import { Provider } from 'react-redux';
import Router from './router';

const Root = ({ store }) => {
  return (
    <Provider store={store} >
      <Router />
    </Provider>
  );
};

export default Root;

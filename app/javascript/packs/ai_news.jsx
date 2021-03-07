import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from '../store/store';
import Root from '../components/root';

document.addEventListener('DOMContentLoaded', () => {
  let store;
  if (window.currentUser) {
    store = configureStore({
      ui: {
        currentUser: window.currentUser
      }
    });
  } else {
    store = configureStore();
  }

  // remove later
  window.store = store;
  
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
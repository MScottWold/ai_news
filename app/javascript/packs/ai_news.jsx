import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from '../store/store';
import Root from '../components/root';
import * as API from '../util/api_util';

document.addEventListener('DOMContentLoaded', () => {
  window.getArticles = API.getArticles;
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

  window.store = store;
  
  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
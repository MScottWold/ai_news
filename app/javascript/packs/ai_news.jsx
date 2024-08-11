import React from 'react';
import { createRoot } from 'react-dom/client';
import createStoreConfiguration from '../store/store';
import Root from '../features/root';

document.addEventListener('DOMContentLoaded', () => {;
  let store;
  if (window.currentUser) {
    store = createStoreConfiguration({
      session: {
        currentUser: window.currentUser,
        errors: [],
      }
    });
  } else {
    store = createStoreConfiguration();
  }

  const root = createRoot(document.getElementById('root'));
  root.render(<Root store={store} />);
});

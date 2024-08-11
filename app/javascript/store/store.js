import { configureStore } from "@reduxjs/toolkit";
import articlesReducer from "../features/articles/articles_slice";
import authorsReducer from "../features/authors/authors_slice";
import filtersReducer from "../features/articles/filters_slice";
import uiReducer from "../features/navigation/ui_slice";
import frontPageReducer from "../features/front_page/front_page_slice";
import sessionReducer from "../features/session/session_slice";

const getMiddlewares = () => {
  if (process.env.NODE_ENV !== "production") {
    const { logger } = require('redux-logger')
    return [logger];
  } else {
    return [];
  }
};

const createStoreConfiguration = (preloadedState = {}) => {
  return configureStore({
    reducer: {
      articles: articlesReducer,
      authors: authorsReducer,
      filters: filtersReducer,
      frontPage: frontPageReducer,
      session: sessionReducer,
      ui: uiReducer,
    },
    preloadedState,
    middleware: (getDefaultMiddleware) => (
      getDefaultMiddleware().concat(getMiddlewares())
    ),
  });
};

export default createStoreConfiguration;

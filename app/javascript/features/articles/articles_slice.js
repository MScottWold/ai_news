import { createSlice, createAsyncThunk, createSelector } from "@reduxjs/toolkit";
import {
  getArticles,
  getArticle,
  getAuthorArticles,
  favoriteRequest,
} from "../../util/api_util";
import { fetchAuthor } from "../authors/authors_slice";

export const fetchArticles = createAsyncThunk(
  "articles/fetchArticles",
  async (params) => await getArticles(params).then((payload) => payload.json()),
);

export const fetchAuthorArticles = createAsyncThunk(
  "articles/fetchAuthorArticles",
  async ({ id, filter }) => (
    await getAuthorArticles(id, filter).then((payload) => payload.json())
  ),
)

export const fetchArticle = createAsyncThunk(
  "acticles/fetchArticle",
  async (id) => await getArticle(id).then((payload) => payload.json()),
);

export const toggleFavorite = createAsyncThunk(
  "articles/favorite",
  async ({ articleId, favoriteId }) => (
    await favoriteRequest(articleId, favoriteId)
  )
);

export const articlesSlice = createSlice({
  name: "articles",
  initialState: {},
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(fetchArticles.fulfilled, (state, action) => (
         Object.assign({}, action.payload.articles, state)
      ))
      .addCase(fetchArticle.fulfilled, (state, action) => {
        const articleId = Object.keys(action.payload)[0];
        state[articleId] = action.payload[articleId];
      })
      .addCase(fetchAuthorArticles.fulfilled, (state, action) => {
        Object.entries(action.payload.articles).forEach(([articleId, article]) => {
          if (!state.hasOwnProperty(articleId)) {
            state[articleId] = article;
          }
        })
      })
      .addCase(toggleFavorite.fulfilled, (state, action) => {
        const { articleId, favoriteId } = action.payload;
        const article = state[articleId];
        article.favoriteId = favoriteId;
      })
      .addCase(fetchAuthor.fulfilled, (state, action) => {
        Object.assign(state, action.payload.articles);
      })
  },
});

// Selectors
export const selectArticles = (filter) => createSelector(
  (state) => state.articles,
  (state) => state.filters[filter],
  (articles, articleIds) => articleIds?.map((id) => articles[id]) || [],
);

export const selectAuthorArticles = (authorId) => createSelector(
  (state) => state.articles,
  (state) => state.authors[authorId]?.articleIds || [],
  (articles, articleIds) => articleIds?.map((id) => articles[id]) || [],
);

// Reducer
export default articlesSlice.reducer;

import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import { getAuthor } from "../../util/api_util";
import { fetchAuthorArticles } from "../articles/articles_slice";

export const fetchAuthor = createAsyncThunk(
  "authors/fetchAuthor",
  async (authorId) => (
    await getAuthor(authorId).then((response) => response.json())
  ),
);

const authorsSlice = createSlice({
  name: "authors",
  initialState: {},
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(fetchAuthor.fulfilled, (state, action) => {
        const author = action.payload.author;
        Object.assign(state, author);
      })
      .addCase(fetchAuthorArticles.fulfilled, (state, action) => {
        const articleIds = Object.keys(action.payload.articles)
        const authorId = action.payload.authorId;
        state[authorId].articleIds.push(...articleIds.reverse());
      })
  },
});

export default authorsSlice.reducer;

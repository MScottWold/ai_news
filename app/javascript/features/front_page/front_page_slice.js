import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import { getFrontPage } from "../../util/api_util";

export const fetchFrontPage = createAsyncThunk(
  "frontPage/fetchFrontPage",
  async () => (
    await getFrontPage().then((payload) => payload.json())
  ),
);

export const frontPageSlice = createSlice({
  name: "frontPage",
  initialState: {
    featured: {},
    highlighted: [],
  },
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(fetchFrontPage.fulfilled, (state, action) => {
        Object.assign(state, action.payload);
      })
  },
});

export default frontPageSlice.reducer;
